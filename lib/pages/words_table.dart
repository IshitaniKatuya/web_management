import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_management_pj/pages/widget/tabel_data.dart';
import 'package:web_management_pj/pages/words_view_model.dart';
import '../model/word.dart';

// ソート状態管理用のプロバイダー
final sortColumnIndexProvider = StateProvider<int?>((ref) => null);
final isFixedColumnProvider = StateProvider<bool>((ref) => true);
final sortAscendingProvider = StateProvider<bool>((ref) => true);
// 検索キーワード管理用のプロバイダー
final searchQueryProvider = StateProvider<String>((ref) => '');

class WordsTable extends ConsumerStatefulWidget {
  const WordsTable({super.key});

  @override
  _WordsTableState createState() => _WordsTableState();
}

class _WordsTableState extends ConsumerState<WordsTable> {
  final ScrollController _horizontalScrollController = ScrollController();
  final ScrollController _verticalScrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(wordsViewModelProvider.notifier).initWords();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final sortColumnIndex = ref.watch(sortColumnIndexProvider);
    final isFixedColumn = ref.watch(isFixedColumnProvider);
    final sortAscending = ref.watch(sortAscendingProvider);
    final searchQuery = ref.watch(searchQueryProvider);
    var data = ref.watch(wordsViewModelProvider);

    // 検索フィルターとソートを適用
    data = _getFilteredData(data, searchQuery);
    if (sortColumnIndex != null) {
      data = _getSortedData(data, sortColumnIndex, sortAscending);
    }

    final tableData = TableData(ref);
    final fixedHeaders = tableData.buildHeader().sublist(0, 6);
    final scrollableHeaders = tableData.buildHeader().sublist(6);

    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: MediaQuery.of(context).size.width * 0.4,
        minHeight: MediaQuery.of(context).size.height * 0.5,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // 検索バー
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  labelText: '検索',
                  hintText: '英単語、日本語訳で検索',
                  prefixIcon: const Icon(Icons.search),
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      _searchController.clear();
                      ref.read(searchQueryProvider.notifier).state = '';
                    },
                  ),
                ),
                onChanged: (value) {
                  ref.read(searchQueryProvider.notifier).state = value;
                },
              ),
            ),

            // テーブル
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 固定列部分
                  DataTable(
                    headingRowColor: MaterialStateProperty.all(Colors.blue[700]),
                    dataRowHeight: 60,
                    horizontalMargin: 16,
                    columnSpacing: 24,
                    sortColumnIndex: isFixedColumn ? sortColumnIndex : null,
                    sortAscending: sortAscending,
                    columns: fixedHeaders.asMap().entries.map((entry) {
                      return DataColumn(
                        label: entry.value.label,
                        onSort: entry.key == 0 ? null : (columnIndex, ascending) {
                          ref.read(sortColumnIndexProvider.notifier).state = columnIndex;
                          ref.read(isFixedColumnProvider.notifier).state = true;
                          ref.read(sortAscendingProvider.notifier).state = ascending;
                        },
                      );
                    }).toList(),
                    rows: data.map((word) {
                      final row = tableData.buildRows(word, context).first;
                      return DataRow(
                        cells: row.cells.sublist(0, 6),
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
                          sortColumnIndex: !isFixedColumn ? sortColumnIndex : null,
                          sortAscending: sortAscending,
                          columns: scrollableHeaders.asMap().entries.map((entry) {
                            return DataColumn(
                              label: entry.value.label,
                              onSort: (columnIndex, ascending) {
                                ref.read(sortColumnIndexProvider.notifier).state = columnIndex;
                                ref.read(isFixedColumnProvider.notifier).state = false;
                                ref.read(sortAscendingProvider.notifier).state = ascending;
                              },
                            );
                          }).toList(),
                          rows: data.map((word) {
                            final row = tableData.buildRows(word, context).first;
                            return DataRow(
                              cells: row.cells.sublist(6),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 検索フィルター
  List<Word> _getFilteredData(List<Word> data, String query) {
    if (query.isEmpty) return data;

    return data.where((word) {
      return word.english.toLowerCase().contains(query.toLowerCase()) ||
          word.japanese1.contains(query) ||
          word.japanese2.contains(query);
    }).toList();
  }

  // ソート処理
  List<Word> _getSortedData(List<Word> data, int columnIndex, bool ascending) {
    return List.from(data)..sort((a, b) {
      var aValue = _getValue(a, columnIndex);
      var bValue = _getValue(b, columnIndex);

      final comparison = ascending ?
      Comparable.compare(aValue.toString(), bValue.toString()) :
      Comparable.compare(bValue.toString(), aValue.toString());

      return comparison;
    });
  }

  dynamic _getValue(Word word, int index) {
    switch (index) {
      case 1: return word.id;
      case 2: return word.number;
      case 3: return word.english;
      case 4: return word.japanese1;
      case 5: return word.japanese2;
      case 6: return word.exampleSentenceEnglish;
      case 7: return word.exampleSentenceJapanese;
      case 8: return word.partOfSpeechNumber;
      case 9: return word.conjugation1;
      case 10: return word.conjugation2;
      case 11: return word.prototypePronunciation;
      case 12: return word.conjugation1Pronunciation;
      case 13: return word.conjugation2Pronunciation;
      case 14: return word.withSetEnglish;
      case 15: return word.withSetJapanese1;
      case 16: return word.withSetJapanese2;
      case 17: return word.pronunciationKana;
      case 18: return word.pronunciationSymbol;
      case 19: return word.polysemy1;
      case 20: return word.polysemy2;
      case 21: return word.silent;
      case 22: return word.primarySchool1;
      case 23: return word.primarySchool2;
      case 24: return word.primarySchool3;
      case 25: return word.primarySchool4;
      case 26: return word.primarySchool5;
      case 27: return word.juniorHighSchool1;
      case 28: return word.juniorHighSchool2;
      case 29: return word.juniorHighSchool3;
      case 30: return word.juniorHighSchool4;
      case 31: return word.juniorHighSchool5;
      case 32: return word.highSchool1;
      case 33: return word.highSchool2;
      case 34: return word.highSchool3;
      case 35: return word.highSchool4;
      case 36: return word.highSchool5;
      case 37: return word.university1;
      case 38: return word.university2;
      case 39: return word.university3;
      case 40: return word.university4;
      case 41: return word.university5;
      case 42: return word.toeic1;
      case 43: return word.toeic2;
      case 44: return word.toeic3;
      case 45: return word.toeic4;
      case 46: return word.toeic5;
      case 47: return word.eiken1;
      case 48: return word.eiken2;
      case 49: return word.eiken3;
      case 50: return word.eiken4;
      case 51: return word.eiken5;
      case 52: return word.eiken6;
      case 53: return word.eiken7;
      case 54: return word.toefl1;
      case 55: return word.toefl2;
      case 56: return word.toefl3;
      case 57: return word.toefl4;
      case 58: return word.toefl5;
      case 59: return word.irregularVerb1;
      case 60: return word.irregularVerb2;
      case 61: return word.irregularVerb3;
      case 62: return word.idioms1;
      case 63: return word.idioms2;
      case 64: return word.idioms3;
      case 65: return word.withSet1;
      case 66: return word.withSet2;
      case 67: return word.withSet3;
      case 68: return word.easyToMistake1;
      case 69: return word.easyToMistake2;
      case 70: return word.easyToMistake3;
      case 71: return word.pronunciationAttention1;
      case 72: return word.pronunciationAttention2;
      case 73: return word.pronunciationAttention3;
      case 74: return word.polysemy1Flag;
      case 75: return word.polysemy2Flag;
      case 76: return word.polysemy3Flag;
      case 77: return word.concern1;
      case 78: return word.concern2;
      case 79: return word.concern3;
      case 80: return word.animal;
      case 81: return word.plant;
      case 82: return word.bodyToFace;
      case 83: return word.food;
      case 84: return word.dailyLife;
      case 85: return word.housesAndFacilities;
      case 86: return word.other;
      case 87: return word.remembered;
      case 88: return word.catStampCount;
      case 89: return word.freePaidKubun;
      case 90: return word.juniorHighSchoolVerb;
      case 91: return word.juniorHighSchoolAdjectives;
      case 92: return word.juniorHighSchoolAdverb;
      case 93: return word.highSchoolVerb;
      case 94: return word.highSchoolAdjectives;
      case 95: return word.highSchoolAdverb;
      case 96: return word.highSchoolNoun;
      default: return '';
    }
  }

  @override
  void dispose() {
    _horizontalScrollController.dispose();
    _verticalScrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }
}