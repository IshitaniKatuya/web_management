import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:web_management_pj/model/word.dart';

import '../words_view_model.dart';

class TableData {
  final List<String> header = [
    'アクション',
    'ID',
    '番号',
    '英単語',
    '日本語訳1',
    '日本語訳2',
    '英語の熟語例文',
    '英語の熟語例文の訳',
    '品詞番号',
    '不規則動詞過去形',
    '不規則動詞過去完了形',
    '不規則動詞原型発音',
    '不規則動詞過去形発音',
    '不規則動詞過去完了形発音',
    'セットの単語',
    'セットの訳1',
    'セットの訳2',
    '発音のカタカナ表記',
    '発音記号',
    '多義語訳1',
    '多義語訳2',
    '黙字あり',
    '小学校推奨',
    '中学 初級',
    '中学 中級',
    '中学 上級A',
    '中学 上級B',
    '高校 初級',
    '高校 中級',
    '高校 上級A',
    '高校 上級B',
    '高校 上級C',
    '共通 基礎',
    '共通 初級',
    '共通 中級',
    '共通 上級A',
    '共通 上級B',
    '東大 基礎',
    '東大 初級',
    '東大 中級',
    '東大 上級A',
    '東大 上級B',
    '京大 基礎',
    '京大 初級',
    '京大 中級',
    '京大 上級A',
    '京大 上級B',
    '英検5級',
    '英検4級',
    '英検3級',
    '英検準2級',
    '英検2級',
    '英検準1級',
    '英検1級',
    'TOEIC基礎',
    'TOEIC初級',
    'TOEIC中級',
    'TOEIC上級A',
    'TOEIC上級B',
    '不規則動詞 中学',
    '不規則動詞 高校',
    '不規則動詞 上級',
    '熟語 中学',
    '熟語 高校A',
    '熟語 高校B',
    'セット 反意語',
    'セット 同義語',
    'セット セットで',
    '間違えやすい 同音異義語',
    '間違えやすい RとL',
    '間違えやすい まぎらわしい',
    '発音注意 国や都市',
    '発音注意 カタカナ語',
    '発音注意 全般',
    '複数の意味 多義語',
    '複数の意味 名詞で動詞',
    '複数の意味 形容詞で動詞',
    '気になる単語 複数形',
    '気になる単語 黙字',
    '気になる単語 数えられない',
    '色々な名詞 動物',
    '色々な名詞 植物',
    '色々な名詞 体や顔',
    '色々な名詞 食べ物',
    '色々な名詞 身の回り品',
    '色々な名詞 家や施設',
    '色々な名詞 その他',
    '無料・有料の識別列',
    'オマケ3 中学の動詞',
    'オマケ3 中学の形容詞',
    'オマケ3 中学の副詞',
    'オマケ3 センターに出たA',
    'オマケ3 センターに出たB',
    'オマケ3 TOEFLに出たA',
    'オマケ3 TOEFLに出たB',
  ];
  final WidgetRef ref;
  final FlutterTts _flutterTts = FlutterTts();

  TableData(this.ref);

  List<DataColumn> buildHeader() {
    return header.map((text) {
      return DataColumn(
        label: _buildHeaderText(text),
      );
    }).toList();
  }

  Widget _buildHeaderText(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  List<DataRow> buildRows(Word data,BuildContext context) {
    return [
      DataRow(
        cells: [
          DataCell(
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    // 編集機能の実装
                    _showEditDialog(context, data);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.save),
                  onPressed: () {
                    // 削除機能の実装
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.volume_down_sharp),
                  onPressed: () async{
                    await _flutterTts.setLanguage("en-US");
                    _flutterTts.speak(data.english);
                  },
                ),
              ],
            ),
          ),
          DataCell(Text(data.id)),
          DataCell(Text(data.number)),
          DataCell(Text(data.english)),
          DataCell(Text(data.japanese1)),
          DataCell(Text(data.japanese2)),
          DataCell(Text(data.exampleSentenceEnglish)),
          DataCell(Text(data.exampleSentenceJapanese)),
          DataCell(Text(data.partOfSpeechNumber.toString())),
          DataCell(Text(data.conjugation1)),
          DataCell(Text(data.conjugation2)),
          DataCell(Text(data.prototypePronunciation)),
          DataCell(Text(data.conjugation1Pronunciation)),
          DataCell(Text(data.conjugation2Pronunciation)),
          DataCell(Text(data.withSetEnglish)),
          DataCell(Text(data.withSetJapanese1)),
          DataCell(Text(data.withSetJapanese2)),
          DataCell(Text(data.pronunciationKana)),
          DataCell(Text(data.pronunciationSymbol)),
          DataCell(Text(data.polysemy1)),
          DataCell(Text(data.polysemy2)),
          DataCell(_buildCheckbox(data.silent, (value) {
            ref.read(wordsViewModelProvider.notifier).updateWord(data.copyWith(silent: value!));
          })),
          DataCell(_buildCheckbox(data.primarySchool1, (value) {
            ref.read(wordsViewModelProvider.notifier).updateWord(data.copyWith(primarySchool1: value!));
          })),
          DataCell(_buildCheckbox(data.primarySchool2, (value) {
            ref.read(wordsViewModelProvider.notifier).updateWord(data.copyWith(primarySchool2: value!));
          })),
          DataCell(_buildCheckbox(data.primarySchool3, (value) {
            ref.read(wordsViewModelProvider.notifier).updateWord(data.copyWith(primarySchool3: value!));
          })),
          DataCell(_buildCheckbox(data.primarySchool4, (value) {
            ref.read(wordsViewModelProvider.notifier).updateWord(data.copyWith(primarySchool4: value!));
          })),
          DataCell(_buildCheckbox(data.primarySchool5, (value) {
            ref.read(wordsViewModelProvider.notifier).updateWord(data.copyWith(primarySchool5: value!));
          })),
          DataCell(_buildCheckbox(data.juniorHighSchool1, (value) {
            ref.read(wordsViewModelProvider.notifier).updateWord(data.copyWith(juniorHighSchool1: value!));
          })),
          DataCell(_buildCheckbox(data.juniorHighSchool2, (value) {
            ref.read(wordsViewModelProvider.notifier).updateWord(data.copyWith(juniorHighSchool2: value!));
          })),
          DataCell(_buildCheckbox(data.juniorHighSchool3, (value) {
            ref.read(wordsViewModelProvider.notifier).updateWord(data.copyWith(juniorHighSchool3: value!));
          })),
          DataCell(_buildCheckbox(data.juniorHighSchool4, (value) {
            ref.read(wordsViewModelProvider.notifier).updateWord(data.copyWith(juniorHighSchool4: value!));
          })),
          DataCell(_buildCheckbox(data.juniorHighSchool5, (value) {
            ref.read(wordsViewModelProvider.notifier).updateWord(data.copyWith(juniorHighSchool5: value!));
          })),
          DataCell(_buildCheckbox(data.highSchool1, (value) {
            ref.read(wordsViewModelProvider.notifier).updateWord(data.copyWith(highSchool1: value!));
          })),
          DataCell(_buildCheckbox(data.highSchool2, (value) {
            ref.read(wordsViewModelProvider.notifier).updateWord(data.copyWith(highSchool2: value!));
          })),
          DataCell(_buildCheckbox(data.highSchool3, (value) {
            ref.read(wordsViewModelProvider.notifier).updateWord(data.copyWith(highSchool3: value!));
          })),
          DataCell(_buildCheckbox(data.highSchool4, (value) {
            ref.read(wordsViewModelProvider.notifier).updateWord(data.copyWith(highSchool4: value!));
          })),
          DataCell(_buildCheckbox(data.highSchool5, (value) {
            ref.read(wordsViewModelProvider.notifier).updateWord(data.copyWith(highSchool5: value!));
          })),
          DataCell(_buildCheckbox(data.university1, (value) {
            ref.read(wordsViewModelProvider.notifier).updateWord(data.copyWith(university1: value!));
          })),
          DataCell(_buildCheckbox(data.university2, (value) {
            ref.read(wordsViewModelProvider.notifier).updateWord(data.copyWith(university2: value!));
          })),
          DataCell(_buildCheckbox(data.university3, (value) {
            ref.read(wordsViewModelProvider.notifier).updateWord(data.copyWith(university3: value!));
          })),
          DataCell(_buildCheckbox(data.university4, (value) {
            ref.read(wordsViewModelProvider.notifier).updateWord(data.copyWith(university4: value!));
          })),
          DataCell(_buildCheckbox(data.university5, (value) {
            ref.read(wordsViewModelProvider.notifier).updateWord(data.copyWith(university5: value!));
          })),
          DataCell(_buildCheckbox(data.toeic1, (value) {
            ref.read(wordsViewModelProvider.notifier).updateWord(data.copyWith(toeic1: value!));
          })),
          DataCell(_buildCheckbox(data.toeic2, (value) {
            ref.read(wordsViewModelProvider.notifier).updateWord(data.copyWith(toeic2: value!));
          })),
          DataCell(_buildCheckbox(data.toeic3, (value) {
            ref.read(wordsViewModelProvider.notifier).updateWord(data.copyWith(toeic3: value!));
          })),
          DataCell(_buildCheckbox(data.toeic4, (value) {
            ref.read(wordsViewModelProvider.notifier).updateWord(data.copyWith(toeic4: value!));
          })),
          DataCell(_buildCheckbox(data.toeic5, (value) {
            ref.read(wordsViewModelProvider.notifier).updateWord(data.copyWith(toeic5: value!));
          })),
          DataCell(_buildCheckbox(data.eiken1, (value) {
            ref.read(wordsViewModelProvider.notifier).updateWord(data.copyWith(eiken1: value!));
          })),
          DataCell(_buildCheckbox(data.eiken2, (value) {
            ref.read(wordsViewModelProvider.notifier).updateWord(data.copyWith(eiken2: value!));
          })),
          DataCell(_buildCheckbox(data.eiken3, (value) {
            ref.read(wordsViewModelProvider.notifier).updateWord(data.copyWith(eiken3: value!));
          })),
          DataCell(_buildCheckbox(data.eiken4, (value) {
            ref.read(wordsViewModelProvider.notifier).updateWord(data.copyWith(eiken4: value!));
          })),
          DataCell(_buildCheckbox(data.eiken5, (value) {
            ref.read(wordsViewModelProvider.notifier).updateWord(data.copyWith(eiken5: value!));
          })),
          DataCell(_buildCheckbox(data.eiken6, (value) {
            ref.read(wordsViewModelProvider.notifier).updateWord(data.copyWith(eiken6: value!));
          })),
          DataCell(_buildCheckbox(data.eiken7, (value) {
            ref.read(wordsViewModelProvider.notifier).updateWord(data.copyWith(eiken7: value!));
          })),
          DataCell(_buildCheckbox(data.toefl1, (value) {
            ref.read(wordsViewModelProvider.notifier).updateWord(data.copyWith(toefl1: value!));
          })),
          DataCell(_buildCheckbox(data.toefl2, (value) {
            ref.read(wordsViewModelProvider.notifier).updateWord(data.copyWith(toefl2: value!));
          })),
          DataCell(_buildCheckbox(data.toefl3, (value) {
            ref.read(wordsViewModelProvider.notifier).updateWord(data.copyWith(toefl3: value!));
          })),
          DataCell(_buildCheckbox(data.toefl4, (value) {
            ref.read(wordsViewModelProvider.notifier).updateWord(data.copyWith(toefl4: value!));
          })),
          DataCell(_buildCheckbox(data.toefl5, (value) {
            ref.read(wordsViewModelProvider.notifier).updateWord(data.copyWith(toefl5: value!));
          })),
          DataCell(_buildCheckbox(data.irregularVerb1, (value) {
            ref.read(wordsViewModelProvider.notifier).updateWord(data.copyWith(irregularVerb1: value!));
          })),
          DataCell(_buildCheckbox(data.irregularVerb2, (value) {
            ref.read(wordsViewModelProvider.notifier).updateWord(data.copyWith(irregularVerb2: value!));
          })),
          DataCell(_buildCheckbox(data.irregularVerb3, (value) {
            ref.read(wordsViewModelProvider.notifier).updateWord(data.copyWith(irregularVerb3: value!));
          })),
          DataCell(_buildCheckbox(data.idioms1, (value) {
            ref.read(wordsViewModelProvider.notifier).updateWord(data.copyWith(idioms1: value!));
          })),
          DataCell(_buildCheckbox(data.idioms2, (value) {
            ref.read(wordsViewModelProvider.notifier).updateWord(data.copyWith(idioms2: value!));
          })),
          DataCell(_buildCheckbox(data.idioms3, (value) {
            ref.read(wordsViewModelProvider.notifier).updateWord(data.copyWith(idioms3: value!));
          })),
          DataCell(_buildCheckbox(data.withSet1, (value) {
            ref.read(wordsViewModelProvider.notifier).updateWord(data.copyWith(withSet1: value!));
          })),
          DataCell(_buildCheckbox(data.withSet2, (value) {
            ref.read(wordsViewModelProvider.notifier).updateWord(data.copyWith(withSet2: value!));
          })),
          DataCell(_buildCheckbox(data.withSet3, (value) {
            ref.read(wordsViewModelProvider.notifier).updateWord(data.copyWith(withSet3: value!));
          })),
          DataCell(_buildCheckbox(data.easyToMistake1, (value) {
            ref.read(wordsViewModelProvider.notifier).updateWord(data.copyWith(easyToMistake1: value!));
          })),
          DataCell(_buildCheckbox(data.easyToMistake2, (value) {
            ref.read(wordsViewModelProvider.notifier).updateWord(data.copyWith(easyToMistake2: value!));
          })),
          DataCell(_buildCheckbox(data.easyToMistake3, (value) {
            ref.read(wordsViewModelProvider.notifier).updateWord(data.copyWith(easyToMistake3: value!));
          })),
          DataCell(_buildCheckbox(data.pronunciationAttention1, (value) {
            ref.read(wordsViewModelProvider.notifier).updateWord(data.copyWith(pronunciationAttention1: value!));
          })),
          DataCell(_buildCheckbox(data.pronunciationAttention2, (value) {
            ref.read(wordsViewModelProvider.notifier).updateWord(data.copyWith(pronunciationAttention2: value!));
          })),
          DataCell(_buildCheckbox(data.pronunciationAttention3, (value) {
            ref.read(wordsViewModelProvider.notifier).updateWord(data.copyWith(pronunciationAttention3: value!));
          })),
          DataCell(_buildCheckbox(data.polysemy1Flag, (value) {
            ref.read(wordsViewModelProvider.notifier).updateWord(data.copyWith(polysemy1Flag: value!));
          })),
          DataCell(_buildCheckbox(data.polysemy2Flag, (value) {
            ref.read(wordsViewModelProvider.notifier).updateWord(data.copyWith(polysemy2Flag: value!));
          })),
          DataCell(_buildCheckbox(data.polysemy3Flag, (value) {
            ref.read(wordsViewModelProvider.notifier).updateWord(data.copyWith(polysemy3Flag: value!));
          })),
          DataCell(_buildCheckbox(data.concern1, (value) {
            ref.read(wordsViewModelProvider.notifier).updateWord(data.copyWith(concern1: value!));
          })),
          DataCell(_buildCheckbox(data.concern2, (value) {
            ref.read(wordsViewModelProvider.notifier).updateWord(data.copyWith(concern2: value!));
          })),
          DataCell(_buildCheckbox(data.concern3, (value) {
            ref.read(wordsViewModelProvider.notifier).updateWord(data.copyWith(concern3: value!));
          })),
          DataCell(_buildCheckbox(data.animal, (value) {
            ref.read(wordsViewModelProvider.notifier).updateWord(data.copyWith(animal: value!));
          })),
          DataCell(_buildCheckbox(data.plant, (value) {
            ref.read(wordsViewModelProvider.notifier).updateWord(data.copyWith(plant: value!));
          })),
          DataCell(_buildCheckbox(data.bodyToFace, (value) {
            ref.read(wordsViewModelProvider.notifier).updateWord(data.copyWith(bodyToFace: value!));
          })),
          DataCell(_buildCheckbox(data.food, (value) {
            ref.read(wordsViewModelProvider.notifier).updateWord(data.copyWith(food: value!));
          })),
          DataCell(_buildCheckbox(data.dailyLife, (value) {
            ref.read(wordsViewModelProvider.notifier).updateWord(data.copyWith(dailyLife: value!));
          })),
          DataCell(_buildCheckbox(data.housesAndFacilities, (value) {
            ref.read(wordsViewModelProvider.notifier).updateWord(data.copyWith(housesAndFacilities: value!));
          })),
          DataCell(_buildCheckbox(data.other, (value) {
            ref.read(wordsViewModelProvider.notifier).updateWord(data.copyWith(other: value!));
          })),
          DataCell(_buildCheckBoxByInt(data.freePaidKubun, (value) {
            final newValue = value! ? 1 : 0;
            ref.read(wordsViewModelProvider.notifier).updateWord(data.copyWith(freePaidKubun: newValue));
          })),
          DataCell(_buildCheckbox(data.juniorHighSchoolVerb, (value) {
            ref.read(wordsViewModelProvider.notifier).updateWord(data.copyWith(juniorHighSchoolVerb: value!));
          })),
          DataCell(_buildCheckbox(data.juniorHighSchoolAdjectives, (value) {
            ref.read(wordsViewModelProvider.notifier).updateWord(data.copyWith(juniorHighSchoolAdjectives: value!));
          })),
          DataCell(_buildCheckbox(data.juniorHighSchoolAdverb, (value) {
            ref.read(wordsViewModelProvider.notifier).updateWord(data.copyWith(juniorHighSchoolAdverb: value!));
          })),
          DataCell(_buildCheckbox(data.highSchoolVerb, (value) {
            ref.read(wordsViewModelProvider.notifier).updateWord(data.copyWith(highSchoolVerb: value!));
          })),
          DataCell(_buildCheckbox(data.highSchoolAdjectives, (value) {
            ref.read(wordsViewModelProvider.notifier).updateWord(data.copyWith(highSchoolAdjectives: value!));
          })),
          DataCell(_buildCheckbox(data.highSchoolAdverb, (value) {
            ref.read(wordsViewModelProvider.notifier).updateWord(data.copyWith(highSchoolAdverb: value!));
          })),
          DataCell(_buildCheckbox(data.highSchoolNoun, (value) {
            ref.read(wordsViewModelProvider.notifier).updateWord(data.copyWith(highSchoolNoun: value!));
          })),
        ],
      ),
    ];
  }

  Widget _buildCheckBoxByInt(int value, Function(bool?) onChanged) {
    return _buildCheckbox(value == 1, onChanged);
  }
  Widget _buildCheckbox(bool value, Function(bool?) onChanged) {
    return Checkbox(
      value: value,
      onChanged: onChanged,
      activeColor: Colors.blue[700],
    );
  }

  InputDecoration _buildInputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      border: const OutlineInputBorder(),
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    );
  }

  void _showEditDialog(BuildContext context, Word word) {
    final screenSize = MediaQuery.of(context).size;

    // テキストコントローラーの初期化
    final englishController = TextEditingController(text: word.english);
    final japanese1Controller = TextEditingController(text: word.japanese1);
    final japanese2Controller = TextEditingController(text: word.japanese2);
    final exampleSentenceEnglishController = TextEditingController(text: word.exampleSentenceEnglish);
    final exampleSentenceJapaneseController = TextEditingController(text: word.exampleSentenceJapanese);
    final conjugation1Controller = TextEditingController(text: word.conjugation1);
    final conjugation2Controller = TextEditingController(text: word.conjugation2);
    final prototypePronunciationController = TextEditingController(text: word.prototypePronunciation);
    final conjugation1PronunciationController = TextEditingController(text: word.conjugation1Pronunciation);
    final conjugation2PronunciationController = TextEditingController(text: word.conjugation2Pronunciation);
    final withSetEnglishController = TextEditingController(text: word.withSetEnglish);
    final withSetJapanese1Controller = TextEditingController(text: word.withSetJapanese1);
    final withSetJapanese2Controller = TextEditingController(text: word.withSetJapanese2);
    final pronunciationKanaController = TextEditingController(text: word.pronunciationKana);
    final pronunciationSymbolController = TextEditingController(text: word.pronunciationSymbol);
    final polysemy1Controller = TextEditingController(text: word.polysemy1);
    final polysemy2Controller = TextEditingController(text: word.polysemy2);
    final partOfSpeechNumberController = TextEditingController(text: word.partOfSpeechNumber.toString());

    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.white,
          child: Container(
            width: screenSize.width * 0.75,
            height: screenSize.height * 0.75,
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ヘッダー部分
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '単語情報の編集',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Divider(),
                const SizedBox(height: 16),

                // フォーム部分
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          controller: englishController,
                          decoration: _buildInputDecoration('英単語'),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: japanese1Controller,
                                decoration: _buildInputDecoration('日本語訳1'),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: TextFormField(
                                controller: japanese2Controller,
                                decoration: _buildInputDecoration('日本語訳2'),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: exampleSentenceEnglishController,
                          decoration: _buildInputDecoration('英語の例文'),
                          maxLines: 2,
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: exampleSentenceJapaneseController,
                          decoration: _buildInputDecoration('例文の訳'),
                          maxLines: 2,
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: conjugation1Controller,
                                decoration: _buildInputDecoration('過去形'),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: TextFormField(
                                controller: conjugation2Controller,
                                decoration: _buildInputDecoration('過去完了形'),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: prototypePronunciationController,
                                decoration: _buildInputDecoration('原型発音'),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: TextFormField(
                                controller: conjugation1PronunciationController,
                                decoration: _buildInputDecoration('過去形発音'),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: conjugation2PronunciationController,
                          decoration: _buildInputDecoration('過去完了形発音'),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: withSetEnglishController,
                                decoration: _buildInputDecoration('セットの単語'),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: TextFormField(
                                controller: withSetJapanese1Controller,
                                decoration: _buildInputDecoration('セットの訳1'),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: withSetJapanese2Controller,
                          decoration: _buildInputDecoration('セットの訳2'),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: pronunciationKanaController,
                                decoration: _buildInputDecoration('発音のカタカナ表記'),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: TextFormField(
                                controller: pronunciationSymbolController,
                                decoration: _buildInputDecoration('発音記号'),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: polysemy1Controller,
                                decoration: _buildInputDecoration('多義語訳1'),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: TextFormField(
                                controller: polysemy2Controller,
                                decoration: _buildInputDecoration('多義語訳2'),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: partOfSpeechNumberController,
                          decoration: _buildInputDecoration('品詞番号'),
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),

                // フッター部分
                const SizedBox(height: 16),
                const Divider(),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('キャンセル'),
                    ),
                    const SizedBox(width: 16),
                    FilledButton(
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      onPressed: () {
                        final updatedWord = word.copyWith(
                          english: englishController.text,
                          japanese1: japanese1Controller.text,
                          japanese2: japanese2Controller.text,
                          exampleSentenceEnglish: exampleSentenceEnglishController.text,
                          exampleSentenceJapanese: exampleSentenceJapaneseController.text,
                          conjugation1: conjugation1Controller.text,
                          conjugation2: conjugation2Controller.text,
                          prototypePronunciation: prototypePronunciationController.text,
                          conjugation1Pronunciation: conjugation1PronunciationController.text,
                          conjugation2Pronunciation: conjugation2PronunciationController.text,
                          withSetEnglish: withSetEnglishController.text,
                          withSetJapanese1: withSetJapanese1Controller.text,
                          withSetJapanese2: withSetJapanese2Controller.text,
                          pronunciationKana: pronunciationKanaController.text,
                          pronunciationSymbol: pronunciationSymbolController.text,
                          polysemy1: polysemy1Controller.text,
                          polysemy2: polysemy2Controller.text,
                          partOfSpeechNumber: int.tryParse(partOfSpeechNumberController.text) ?? word.partOfSpeechNumber,
                        );

                        ref.read(wordsViewModelProvider.notifier).updateWord(updatedWord);
                        Navigator.of(context).pop();
                      },
                      child: const Text('確定'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    ).whenComplete(() {
      // コントローラーの破棄
      englishController.dispose();
      japanese1Controller.dispose();
      japanese2Controller.dispose();
      exampleSentenceEnglishController.dispose();
      exampleSentenceJapaneseController.dispose();
      conjugation1Controller.dispose();
      conjugation2Controller.dispose();
      prototypePronunciationController.dispose();
      conjugation1PronunciationController.dispose();
      conjugation2PronunciationController.dispose();
      withSetEnglishController.dispose();
      withSetJapanese1Controller.dispose();
      withSetJapanese2Controller.dispose();
      pronunciationKanaController.dispose();
      pronunciationSymbolController.dispose();
      polysemy1Controller.dispose();
      polysemy2Controller.dispose();
      partOfSpeechNumberController.dispose();
    });
  }

}