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
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      ref.read(wordsViewModelProvider.notifier).initWords();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dummyData = ref.watch(wordsViewModelProvider);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Scrollbar(
        controller: _verticalScrollController,
        thumbVisibility: true,
        child: Scrollbar(
          controller: _horizontalScrollController,
          thumbVisibility: true,
          notificationPredicate: (notification) => notification.depth == 1,
          child: SingleChildScrollView(
            controller: _verticalScrollController,
            child: SingleChildScrollView(
              controller: _horizontalScrollController,
              scrollDirection: Axis.horizontal,
              child: DataTable(
                headingRowColor: MaterialStateProperty.all(Colors.blue[700]),
                dataRowHeight: 60,
                horizontalMargin: 16,
                columnSpacing: 24,
                columns: TableData(ref).buildHeader(),
                rows: dummyData.map((word) =>
                TableData(ref)
                    .buildRows(word, context)
                    .first
                ).toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}