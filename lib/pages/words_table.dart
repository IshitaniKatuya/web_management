import 'package:flutter/material.dart';

class Word {
  final String id;
  final String number;
  final int points;
  final String english;
  String japanese1;
  String japanese2;
  String exampleSentenceEnglish;
  String exampleSentenceJapanese;
  String conjugation1;
  String conjugation2;
  String prototypePronunciation;
  String conjugation1Pronunciation;
  String conjugation2Pronunciation;
  String withSetEnglish;
  String withSetJapanese1;
  String withSetJapanese2;
  String pronunciationKana;
  String pronunciationSymbol;
  String polysemy1;
  String polysemy2;
  bool silent;
  int partOfSpeechNumber;
  // 学校レベルと試験レベルのフィールド
  bool primarySchool1;
  bool primarySchool2;
  bool primarySchool3;
  bool primarySchool4;
  bool primarySchool5;
  bool juniorHighSchool1;
  bool juniorHighSchool2;
  bool juniorHighSchool3;
  bool juniorHighSchool4;
  bool juniorHighSchool5;
  bool highSchool1;
  bool highSchool2;
  bool highSchool3;
  bool highSchool4;
  bool highSchool5;
  bool university1;
  bool university2;
  bool university3;
  bool university4;
  bool university5;
  bool toeic1;
  bool toeic2;
  bool toeic3;
  bool toeic4;
  bool toeic5;
  bool eiken1;
  bool eiken2;
  bool eiken3;
  bool eiken4;
  bool eiken5;
  bool eiken6;
  bool eiken7;
  bool toefl1;
  bool toefl2;
  bool toefl3;
  bool toefl4;
  bool toefl5;
  bool irregularVerb1;
  bool irregularVerb2;
  bool irregularVerb3;
  bool idioms1;
  bool idioms2;
  bool idioms3;
  bool withSet1;
  bool withSet2;
  bool withSet3;
  bool easyToMistake1;
  bool easyToMistake2;
  bool easyToMistake3;
  bool pronunciationAttention1;
  bool pronunciationAttention2;
  bool pronunciationAttention3;
  bool polysemy1Flag;
  bool polysemy2Flag;
  bool polysemy3Flag;
  bool concern1;
  bool concern2;
  bool concern3;
  bool animal;
  bool plant;
  bool bodyToFace;
  bool food;
  bool dailyLife;
  bool housesAndFacilities;
  bool other;
  bool remembered;
  int catStampCount;
  int freePaidKubun;
  bool juniorHighSchoolVerb;
  bool juniorHighSchoolAdjectives;
  bool juniorHighSchoolAdverb;
  bool highSchoolVerb;
  bool highSchoolAdjectives;
  bool highSchoolAdverb;
  bool highSchoolNoun;

  Word({
    required this.id,
    required this.number,
    required this.points,
    required this.english,
    required this.japanese1,
    required this.japanese2,
    required this.exampleSentenceEnglish,
    required this.exampleSentenceJapanese,
    required this.conjugation1,
    required this.conjugation2,
    required this.prototypePronunciation,
    required this.conjugation1Pronunciation,
    required this.conjugation2Pronunciation,
    required this.withSetEnglish,
    required this.withSetJapanese1,
    required this.withSetJapanese2,
    required this.pronunciationKana,
    required this.pronunciationSymbol,
    required this.polysemy1,
    required this.polysemy2,
    required this.silent,
    required this.partOfSpeechNumber,
    required this.primarySchool1,
    required this.primarySchool2,
    required this.primarySchool3,
    required this.primarySchool4,
    required this.primarySchool5,
    required this.juniorHighSchool1,
    required this.juniorHighSchool2,
    required this.juniorHighSchool3,
    required this.juniorHighSchool4,
    required this.juniorHighSchool5,
    required this.highSchool1,
    required this.highSchool2,
    required this.highSchool3,
    required this.highSchool4,
    required this.highSchool5,
    required this.university1,
    required this.university2,
    required this.university3,
    required this.university4,
    required this.university5,
    required this.toeic1,
    required this.toeic2,
    required this.toeic3,
    required this.toeic4,
    required this.toeic5,
    required this.eiken1,
    required this.eiken2,
    required this.eiken3,
    required this.eiken4,
    required this.eiken5,
    required this.eiken6,
    required this.eiken7,
    required this.toefl1,
    required this.toefl2,
    required this.toefl3,
    required this.toefl4,
    required this.toefl5,
    required this.irregularVerb1,
    required this.irregularVerb2,
    required this.irregularVerb3,
    required this.idioms1,
    required this.idioms2,
    required this.idioms3,
    required this.withSet1,
    required this.withSet2,
    required this.withSet3,
    required this.easyToMistake1,
    required this.easyToMistake2,
    required this.easyToMistake3,
    required this.pronunciationAttention1,
    required this.pronunciationAttention2,
    required this.pronunciationAttention3,
    required this.polysemy1Flag,
    required this.polysemy2Flag,
    required this.polysemy3Flag,
    required this.concern1,
    required this.concern2,
    required this.concern3,
    required this.animal,
    required this.plant,
    required this.bodyToFace,
    required this.food,
    required this.dailyLife,
    required this.housesAndFacilities,
    required this.other,
    required this.remembered,
    required this.catStampCount,
    required this.freePaidKubun,
    required this.juniorHighSchoolVerb,
    required this.juniorHighSchoolAdjectives,
    required this.juniorHighSchoolAdverb,
    required this.highSchoolVerb,
    required this.highSchoolAdjectives,
    required this.highSchoolAdverb,
    required this.highSchoolNoun,
  });
}

class WordsTable extends StatefulWidget {
  @override
  _WordsTableState createState() => _WordsTableState();
}

class _WordsTableState extends State<WordsTable> {
  late ScrollController _horizontalScrollController = ScrollController();
  late ScrollController _verticalScrollController = ScrollController();

  List<Word> words = [
    Word(
      id: '001',
      number: '1',
      points: 100,
      english: 'abandon',
      japanese1: '見捨てる',
      japanese2: '放棄する',
      exampleSentenceEnglish: 'He had to abandon the car.',
      exampleSentenceJapanese: '彼は車を放棄せざるを得なかった。',
      conjugation1: 'abandoned',
      conjugation2: 'abandoning',
      prototypePronunciation: 'əˈbændən',
      conjugation1Pronunciation: 'əˈbændənd',
      conjugation2Pronunciation: 'əˈbændənɪŋ',
      withSetEnglish: 'abandon hope',
      withSetJapanese1: '希望を捨てる',
      withSetJapanese2: '',
      pronunciationKana: 'アバンドン',
      pronunciationSymbol: 'əˈbændən',
      polysemy1: '放棄する',
      polysemy2: '見捨てる',
      silent: false,
      partOfSpeechNumber: 1,
      primarySchool1: false,
      primarySchool2: false,
      primarySchool3: true,
      primarySchool4: false,
      primarySchool5: false,
      juniorHighSchool1: true,
      juniorHighSchool2: false,
      juniorHighSchool3: false,
      juniorHighSchool4: false,
      juniorHighSchool5: false,
      highSchool1: true,
      highSchool2: false,
      highSchool3: false,
      highSchool4: false,
      highSchool5: false,
      university1: false,
      university2: false,
      university3: false,
      university4: false,
      university5: false,
      toeic1: true,
      toeic2: false,
      toeic3: false,
      toeic4: false,
      toeic5: false,
      eiken1: false,
      eiken2: true,
      eiken3: false,
      eiken4: false,
      eiken5: false,
      eiken6: false,
      eiken7: false,
      toefl1: false,
      toefl2: false,
      toefl3: false,
      toefl4: false,
      toefl5: false,
      irregularVerb1: false,
      irregularVerb2: false,
      irregularVerb3: false,
      idioms1: false,
      idioms2: false,
      idioms3: false,
      withSet1: true,
      withSet2: false,
      withSet3: false,
      easyToMistake1: false,
      easyToMistake2: false,
      easyToMistake3: false,
      pronunciationAttention1: true,
      pronunciationAttention2: false,
      pronunciationAttention3: false,
      polysemy1Flag: true,
      polysemy2Flag: false,
      polysemy3Flag: false,
      concern1: false,
      concern2: false,
      concern3: false,
      animal: false,
      plant: false,
      bodyToFace: false,
      food: false,
      dailyLife: true,
      housesAndFacilities: false,
      other: false,
      remembered: true,
      catStampCount: 3,
      freePaidKubun: 1,
      juniorHighSchoolVerb: true,
      juniorHighSchoolAdjectives: false,
      juniorHighSchoolAdverb: false,
      highSchoolVerb: false,
      highSchoolAdjectives: false,
      highSchoolAdverb: false,
      highSchoolNoun: false,
    ),
    // 他のテストデータも同様に追加可能
  ];

  @override
  Widget build(BuildContext context) {
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
                columns: _buildColumns(),
                rows: _buildRows(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<DataColumn> _buildColumns() {
    return [
      DataColumn(label: _buildHeaderText('アクション')),
      DataColumn(label: _buildHeaderText('ID')),
      DataColumn(label: _buildHeaderText('番号')),
      DataColumn(label: _buildHeaderText('英単語')),
      DataColumn(label: _buildHeaderText('日本語訳1')),
      DataColumn(label: _buildHeaderText('日本語訳2')),
      // 以降にエクセルの列名に対応するDataColumnを追加　TODO

      //オマケの2　熟語　の例文と訳
      DataColumn(label: _buildHeaderText('英語の例文')),
      DataColumn(label: _buildHeaderText('例文の訳')),

      // DataColumn(label: _buildHeaderText('品詞番号')),
      //オマケの1　不規則動詞の変化形
      // DataColumn(label: _buildHeaderText('過去形)')),
      // DataColumn(label: _buildHeaderText('過去完了形')),
      //発音にかかわる部分
      DataColumn(label: _buildHeaderText('原型発音')),
      DataColumn(label: _buildHeaderText('過去形発音')),
      DataColumn(label: _buildHeaderText('過去完了形発音')),
      //オマケの3　セットで覚える英単語
      DataColumn(label: _buildHeaderText('セットの単語')),
      DataColumn(label: _buildHeaderText('セットの訳1')),
      DataColumn(label: _buildHeaderText('セットの訳2')),
      //オマケの5　発音注意
      DataColumn(label: _buildHeaderText('発音のカタカナ表記')),
      DataColumn(label: _buildHeaderText('発音記号')),
      //おまけの6　複数の意味
      DataColumn(label: _buildHeaderText('多義語訳1')),
      DataColumn(label: _buildHeaderText('多義語訳2')),
      //オマケの7気になる単語
      DataColumn(label: _buildHeaderText('黙字の位置')),


      DataColumn(label: _buildHeaderText('小学校推奨')),
      DataColumn(label: _buildHeaderText('中学 初級')),
      DataColumn(label: _buildHeaderText('中学 中級')),
      DataColumn(label: _buildHeaderText('中学 上級A')),
      DataColumn(label: _buildHeaderText('中学 上級B')),
      DataColumn(label: _buildHeaderText('高校 初級')),
      DataColumn(label: _buildHeaderText('高校 中級')),
      DataColumn(label: _buildHeaderText('高校 上級A')),
      DataColumn(label: _buildHeaderText('高校 上級B')),
      DataColumn(label: _buildHeaderText('高校 上級C')),
      DataColumn(label: _buildHeaderText('共通 基礎')),
      DataColumn(label: _buildHeaderText('共通 初級')),
      DataColumn(label: _buildHeaderText('共通 中級')),
      DataColumn(label: _buildHeaderText('共通 上級A')),
      DataColumn(label: _buildHeaderText('共通 上級B')),
      DataColumn(label: _buildHeaderText('東大 基礎')),
      DataColumn(label: _buildHeaderText('東大 初級')),
      DataColumn(label: _buildHeaderText('東大 中級')),
      DataColumn(label: _buildHeaderText('東大 上級A')),
      DataColumn(label: _buildHeaderText('東大 上級B')),
      DataColumn(label: _buildHeaderText('京大 基礎')),
      DataColumn(label: _buildHeaderText('京大 初級')),
      DataColumn(label: _buildHeaderText('京大 中級')),
      DataColumn(label: _buildHeaderText('京大 上級A')),
      DataColumn(label: _buildHeaderText('京大 上級B')),
      DataColumn(label: _buildHeaderText('TOEIC基礎')),
      DataColumn(label: _buildHeaderText('TOEIC初級')),
      DataColumn(label: _buildHeaderText('TOEIC中級')),
      DataColumn(label: _buildHeaderText('TOEIC上級A')),
      DataColumn(label: _buildHeaderText('TOEIC上級B')),
      DataColumn(label: _buildHeaderText('英検5級')),
      DataColumn(label: _buildHeaderText('英検4級')),
      DataColumn(label: _buildHeaderText('英検3級')),
      DataColumn(label: _buildHeaderText('英検準2級')),
      DataColumn(label: _buildHeaderText('英検2級')),
      DataColumn(label: _buildHeaderText('英検準1級')),
      DataColumn(label: _buildHeaderText('英検1級')),
      //オマケ1の1不規則動詞
      DataColumn(label: _buildHeaderText('中学不規則')),
      DataColumn(label: _buildHeaderText('高校不規則')),
      DataColumn(label: _buildHeaderText('上級不規則')),
      //オマケ1の2熟語
      DataColumn(label: _buildHeaderText('中学熟語')),
      DataColumn(label: _buildHeaderText('高校A熟語')),
      DataColumn(label: _buildHeaderText('高校B熟語')),
      //オマケ1の3セットで覚える
      DataColumn(label: _buildHeaderText('反意語')),
      DataColumn(label: _buildHeaderText('同義語')),
      DataColumn(label: _buildHeaderText('セットで')),
      //オマケ1の4間違いやすい
      DataColumn(label: _buildHeaderText('同音異義語')),
      DataColumn(label: _buildHeaderText('RとL')),
      DataColumn(label: _buildHeaderText('まぎらわしい')),
      //オマケ1の5発音注意
      DataColumn(label: _buildHeaderText('国や都市')),
      DataColumn(label: _buildHeaderText('カタカナ語')),
      DataColumn(label: _buildHeaderText('全般')),
      //オマケ1の6
      DataColumn(label: _buildHeaderText('多義語')),
      DataColumn(label: _buildHeaderText('名詞で動詞')),
      DataColumn(label: _buildHeaderText('形容詞で動詞')),
      //オマケ1の7気になる単語
      DataColumn(label: _buildHeaderText('複数形')),
      DataColumn(label: _buildHeaderText('黙字')),
      DataColumn(label: _buildHeaderText('数えられない')),
      //オマケ2　色々な名詞
      DataColumn(label: _buildHeaderText('動物')),
      DataColumn(label: _buildHeaderText('植物')),
      DataColumn(label: _buildHeaderText('体や顔')),
      DataColumn(label: _buildHeaderText('食べ物')),
      DataColumn(label: _buildHeaderText('身の回り品')),
      DataColumn(label: _buildHeaderText('家や施設')),
      DataColumn(label: _buildHeaderText('その他')),
      //無料の単語は　0/有料の単語は　1
      // DataColumn(label: _buildHeaderText('無料・有料の識別列')),
      //オマケ3　中学の動詞・センター・TOEFLなど
      DataColumn(label: _buildHeaderText('中学の動詞')),
      DataColumn(label: _buildHeaderText('中学の形容詞')),
      DataColumn(label: _buildHeaderText('中学の副詞')),
      DataColumn(label: _buildHeaderText('センターに出たA')),
      DataColumn(label: _buildHeaderText('センターに出たB')),
      // DataColumn(label: _buildHeaderText('TOEFLに出たA')),
      // DataColumn(label: _buildHeaderText('TOEFLに出たB')),

    ];
  }

  List<DataRow> _buildRows() {
    return words.asMap().entries.map((entry) {
      final index = entry.key;
      final word = entry.value;
      return DataRow(
        cells: [
          DataCell(_buildActionButtons(index)),
          DataCell(Text(word.id)),
          DataCell(Text(word.number)),
          DataCell(Text(word.english)),
          DataCell(Text(word.japanese1)),
          DataCell(Text(word.japanese2)),


          //追加
          DataCell(Text(word.exampleSentenceEnglish)),
          DataCell(Text(word.exampleSentenceJapanese)),
          DataCell(Text(word.)),
          DataCell(Text(word.conjugation1)),
          DataCell(Text(word.conjugation2)),
          //オマケの1　不規則動詞の変化形 ないかも
          DataCell(Text(word.prototypePronunciation)),
          DataCell(Text(word.conjugation1Pronunciation)),
          DataCell(Text(word.conjugation2Pronunciation)),
          DataCell(Text(word.withSetEnglish)),
          DataCell(Text(word.withSetJapanese1)),
          DataCell(Text(word.withSetJapanese2)),
          DataCell(Text(word.pronunciationKana)),
          DataCell(Text(word.pronunciationSymbol)),
          DataCell(Text(word.polysemy1)),
          DataCell(Text(word.polysemy2)),
          DataCell(_buildCheckbox(word.silent, (value) {
            setState(() {
              words[index].silent = value!;
            });
          })),
          DataCell(_buildCheckbox(word.primarySchool1, (value) {
            setState(() {
              words[index].primarySchool1 = value!;
            });
          })),
          DataCell(_buildCheckbox(word.primarySchool2, (value) {
            setState(() {
              words[index].primarySchool2 = value!;
            });
          })),
          DataCell(_buildCheckbox(word.primarySchool3, (value) {
            setState(() {
              words[index].primarySchool3 = value!;
            });
          })),
          DataCell(_buildCheckbox(word.primarySchool4, (value) {
            setState(() {
              words[index].primarySchool4 = value!;
            });
          })),
          DataCell(_buildCheckbox(word.primarySchool5, (value) {
            setState(() {
              words[index].primarySchool5 = value!;
            });
          })),
          DataCell(_buildCheckbox(word.juniorHighSchool1, (value) {
            setState(() {
              words[index].juniorHighSchool1 = value!;
            });
          })),
          DataCell(_buildCheckbox(word.juniorHighSchool2, (value) {
            setState(() {
              words[index].juniorHighSchool2 = value!;
            });
          })),
          DataCell(_buildCheckbox(word.juniorHighSchool3, (value) {
            setState(() {
              words[index].juniorHighSchool3 = value!;
            });
          })),
          DataCell(_buildCheckbox(word.juniorHighSchool4, (value) {
            setState(() {
              words[index].juniorHighSchool4 = value!;
            });
          })),
          DataCell(_buildCheckbox(word.juniorHighSchool5, (value) {
            setState(() {
              words[index].juniorHighSchool5 = value!;
            });
          })),
          DataCell(_buildCheckbox(word.highSchool1, (value) {
            setState(() {
              words[index].highSchool1 = value!;
            });
          })),
          DataCell(_buildCheckbox(word.highSchool2, (value) {
            setState(() {
              words[index].highSchool2 = value!;
            });
          })),
          DataCell(_buildCheckbox(word.highSchool3, (value) {
            setState(() {
              words[index].highSchool3 = value!;
            });
          })),
          DataCell(_buildCheckbox(word.highSchool4, (value) {
            setState(() {
              words[index].highSchool4 = value!;
            });
          })),
          DataCell(_buildCheckbox(word.highSchool5, (value) {
            setState(() {
              words[index].highSchool5 = value!;
            });
          })),
          DataCell(_buildCheckbox(word.university1, (value) {
            setState(() {
              words[index].university1 = value!;
            });
          })),
          DataCell(_buildCheckbox(word.university2, (value) {
            setState(() {
              words[index].university2 = value!;
            });
          })),
          DataCell(_buildCheckbox(word.university3, (value) {
            setState(() {
              words[index].university3 = value!;
            });
          })),
          DataCell(_buildCheckbox(word.university4, (value) {
            setState(() {
              words[index].university4 = value!;
            });
          })),
          DataCell(_buildCheckbox(word.university5, (value) {
            setState(() {
              words[index].university5 = value!;
            });
          })),
          DataCell(_buildCheckbox(word.toeic1, (value) {
            setState(() {
              words[index].toeic1 = value!;
            });
          })),
          DataCell(_buildCheckbox(word.toeic2, (value) {
            setState(() {
              words[index].toeic2 = value!;
            });
          })),
          DataCell(_buildCheckbox(word.toeic3, (value) {
            setState(() {
              words[index].toeic3 = value!;
            });
          })),
          DataCell(_buildCheckbox(word.toeic4, (value) {
            setState(() {
              words[index].toeic4 = value!;
            });
          })),
          DataCell(_buildCheckbox(word.toeic5, (value) {
            setState(() {
              words[index].toeic5 = value!;
            });
          })),


          //追加
          DataCell(_buildCheckbox(word.eiken1, (value) {
            setState(() {
              words[index].eiken1 = value!;
            });
          })),
          DataCell(_buildCheckbox(word.eiken2, (value) {
            setState(() {
              words[index].eiken2 = value!;
            });
          })),
          DataCell(_buildCheckbox(word.eiken3, (value) {
            setState(() {
              words[index].eiken3 = value!;
            });
          })),
          DataCell(_buildCheckbox(word.eiken4, (value) {
            setState(() {
              words[index].eiken4 = value!;
            });
          })),
          DataCell(_buildCheckbox(word.eiken5, (value) {
            setState(() {
              words[index].eiken5 = value!;
            });
          })),
          DataCell(_buildCheckbox(word.eiken6, (value) {
            setState(() {
              words[index].eiken6 = value!;
            });
          })),
          DataCell(_buildCheckbox(word.eiken7, (value) {
            setState(() {
              words[index].eiken7 = value!;
            });
          })),
          DataCell(_buildCheckbox(word.irregularVerb1, (value) {
            setState(() {
              words[index].irregularVerb1 = value!;
            });
          })),
          DataCell(_buildCheckbox(word.irregularVerb2, (value) {
            setState(() {
              words[index].irregularVerb2 = value!;
            });
          })),
          DataCell(_buildCheckbox(word.irregularVerb3, (value) {
            setState(() {
              words[index].irregularVerb3 = value!;
            });
          })),
          DataCell(_buildCheckbox(word.idioms1, (value) {
            setState(() {
              words[index].idioms1 = value!;
            });
          })),
          DataCell(_buildCheckbox(word.idioms2, (value) {
            setState(() {
              words[index].idioms2 = value!;
            });
          })),
          DataCell(_buildCheckbox(word.idioms3, (value) {
            setState(() {
              words[index].idioms3 = value!;
            });
          })),
          DataCell(_buildCheckbox(word.withSet1, (value) {
            setState(() {
              words[index].withSet1 = value!;
            });
          })),
          DataCell(_buildCheckbox(word.withSet2, (value) {
            setState(() {
              words[index].withSet2 = value!;
            });
          })),
          DataCell(_buildCheckbox(word.withSet3, (value) {
            setState(() {
              words[index].withSet3 = value!;
            });
          })),
          DataCell(_buildCheckbox(word.easyToMistake1, (value) {
            setState(() {
              words[index].easyToMistake1 = value!;
            });
          })),
          DataCell(_buildCheckbox(word.easyToMistake2, (value) {
            setState(() {
              words[index].easyToMistake2 = value!;
            });
          })),
          DataCell(_buildCheckbox(word.easyToMistake3, (value) {
            setState(() {
              words[index].easyToMistake3 = value!;
            });
          })),
          DataCell(_buildCheckbox(word.pronunciationAttention1, (value) {
            setState(() {
              words[index].pronunciationAttention1 = value!;
            });
          })),
          DataCell(_buildCheckbox(word.pronunciationAttention2, (value) {
            setState(() {
              words[index].pronunciationAttention2 = value!;
            });
          })),
          DataCell(_buildCheckbox(word.pronunciationAttention3, (value) {
            setState(() {
              words[index].pronunciationAttention3 = value!;
            });
          })),
          DataCell(_buildCheckbox(word.polysemy1Flag, (value) {
            setState(() {
              words[index].polysemy1Flag = value!;
            });
          })),
          DataCell(_buildCheckbox(word.polysemy2Flag, (value) {
            setState(() {
              words[index].polysemy2Flag = value!;
            });
          })),
          DataCell(_buildCheckbox(word.polysemy3Flag, (value) {
            setState(() {
              words[index].polysemy3Flag = value!;
            });
          })),
          DataCell(_buildCheckbox(word.concern1, (value) {
            setState(() {
              words[index].concern1 = value!;
            });
          })),
          DataCell(_buildCheckbox(word.concern2, (value) {
            setState(() {
              words[index].concern2 = value!;
            });
          })),
          DataCell(_buildCheckbox(word.concern3, (value) {
            setState(() {
              words[index].concern3 = value!;
            });
          })),
          DataCell(_buildCheckbox(word.animal, (value) {
            setState(() {
              words[index].animal = value!;
            });
          })),
          DataCell(_buildCheckbox(word.plant, (value) {
            setState(() {
              words[index].plant = value!;
            });
          })),
          DataCell(_buildCheckbox(word.bodyToFace, (value) {
            setState(() {
              words[index].bodyToFace = value!;
            });
          })),
          DataCell(_buildCheckbox(word.food, (value) {
            setState(() {
              words[index].food = value!;
            });
          })),
          DataCell(_buildCheckbox(word.dailyLife, (value) {
            setState(() {
              words[index].dailyLife = value!;
            });
          })),
          DataCell(_buildCheckbox(word.housesAndFacilities, (value) {
            setState(() {
              words[index].housesAndFacilities = value!;
            });
          })),
          DataCell(_buildCheckbox(word.other, (value) {
            setState(() {
              words[index].other = value!;
            });
          })),
          DataCell(_buildCheckbox(word.juniorHighSchoolVerb, (value) {
            setState(() {
              words[index].juniorHighSchoolVerb = value!;
            });
          })),
          DataCell(_buildCheckbox(word.juniorHighSchoolAdjectives, (value) {
            setState(() {
              words[index].juniorHighSchoolAdjectives = value!;
            });
          })),
          DataCell(_buildCheckbox(word.juniorHighSchoolAdverb, (value) {
            setState(() {
              words[index].juniorHighSchoolAdverb = value!;
            });
          })),
          DataCell(_buildCheckbox(word.highSchoolVerb, (value) {
            setState(() {
              words[index].highSchoolVerb = value!;
            });
          })),
          DataCell(_buildCheckbox(word.highSchoolAdjectives, (value) {
            setState(() {
              words[index].highSchoolAdjectives = value!;
            });
          })),
          DataCell(_buildCheckbox(word.highSchoolAdverb, (value) {
            setState(() {
              words[index].highSchoolAdverb = value!;
            });
          })),
          DataCell(_buildCheckbox(word.highSchoolNoun, (value) {
            setState(() {
              words[index].highSchoolNoun = value!;
            });
          })),
          
        ],
      );
    }).toList();
  }

  Widget _buildCheckbox(bool value, Function(bool?) onChanged) {
    return Checkbox(
      value: value,
      onChanged: onChanged,
      activeColor: Colors.blue[700],
    );
  }

  Widget _buildActionButtons(int index) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(Icons.edit, color: Colors.blue[700]),
          onPressed: () => _showEditDialog(context, index),
        ),
        IconButton(
          icon: Icon(Icons.volume_up, color: Colors.blue[700]),
          onPressed: () {
            // 音声再生機能の実装予定
          },
        ),
      ],
    );
  }

  Widget _buildHeaderText(String text) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  void _showEditDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('単語情報の編集'),
          content: Text('編集ダイアログの内容'),
          actions: [

            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('キャンセル'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('保存'),
            ),
          ],
        );
      },
    );
  }
}