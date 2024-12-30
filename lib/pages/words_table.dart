import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_management_pj/pages/widget/tabel_data.dart';
import 'package:web_management_pj/pages/words_view_model.dart';
import '../model/word.dart';

class WordsTable extends ConsumerStatefulWidget {
  const WordsTable({super.key});

  @override
  _WordsTableState createState() => _WordsTableState();
}

class _WordsTableState extends ConsumerState<WordsTable> {
  final ScrollController _horizontalScrollController = ScrollController();
  final ScrollController _verticalScrollController = ScrollController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(wordsViewModelProvider.notifier).initWords();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(wordsViewModelProvider);
    final tableData = TableData(ref);

    // 固定列のヘッダー
    final fixedHeaders = tableData.buildHeader().sublist(0, 6); // アクション〜日本語訳2まで
    // スクロール可能な列のヘッダー
    final scrollableHeaders = tableData.buildHeader().sublist(6);

    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: MediaQuery.of(context).size.width*0.4,
        minHeight: MediaQuery.of(context).size.height*0.5,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 固定列部分
            DataTable(
              headingRowColor: MaterialStateProperty.all(Colors.blue[700]),
              dataRowHeight: 60,
              horizontalMargin: 16,
              columnSpacing: 24,
              columns: fixedHeaders,
              rows: data.map((word) {
                final row = tableData.buildRows(word, context).first;
                return DataRow(
                  cells: row.cells.sublist(0, 6), // アクション〜日本語訳2まで
                );
              }).toList(),
            ),

            // スクロール可能な列部分
            Expanded(
              child: Scrollbar(
                controller: _horizontalScrollController,
                thumbVisibility: true,
                child: SingleChildScrollView(
                  controller: _horizontalScrollController,
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    headingRowColor: MaterialStateProperty.all(Colors.blue[700]),
                    dataRowHeight: 60,
                    horizontalMargin: 16,
                    columnSpacing: 24,
                    columns: scrollableHeaders,
                    rows: data.map((word) {
                      final row = tableData.buildRows(word, context).first;
                      return DataRow(
                        cells: row.cells.sublist(6), // 日本語訳2以降
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _horizontalScrollController.dispose();
    _verticalScrollController.dispose();
    super.dispose();
  }
}