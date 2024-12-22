import 'package:flutter/material.dart';

class User {
  final String id;
  String name;
  int age;
  String hobby;

  User({required this.id, required this.name, required this.age, required this.hobby});
}

class Word {
  final String id;
  String word;
  String japaneseTranslation;
  String pronunciation;
  String phoneticSymbol;

  Word({required this.id, required this.word, required this.japaneseTranslation, required this.pronunciation, required this.phoneticSymbol});
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('単語情報テーブル'),
        ),
        body: WordsTable(),
      ),
    );
  }
}

class WordsTable extends StatefulWidget {
  @override
  _WordsTableState createState() => _WordsTableState();
}

class _WordsTableState extends State<WordsTable> {
  List<Word> words = [
    Word(id: '001', word: 'apple', japaneseTranslation: 'りんご', pronunciation: 'ap・ple', phoneticSymbol: 'æpl'),
    Word(id: '002', word: 'orange', japaneseTranslation: 'オレンジ', pronunciation: 'or・ange', phoneticSymbol: 'ɔːrɪndʒ'),
    Word(id: '003', word: 'banana', japaneseTranslation: 'バナナ', pronunciation: 'ba・nan・a', phoneticSymbol: 'bənˈænə'),
  ];

  final TextEditingController wordController = TextEditingController();
  final TextEditingController japaneseTranslationController = TextEditingController();
  final TextEditingController pronunciationController = TextEditingController();
  final TextEditingController phoneticSymbolController = TextEditingController();
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: [
              DataColumn(label: Text('ID')),
              DataColumn(label: Text('単語')),
              DataColumn(label: Text('日本語訳')),
              DataColumn(label: Text('発音')),
              DataColumn(label: Text('発音記号')),
              DataColumn(label: Text('編集')),
            ],
            rows: words.map((word) {
              int index = words.indexOf(word);
              return DataRow(cells: [
                DataCell(Text(word.id)),
                DataCell(Text(word.word)),
                DataCell(Text(word.japaneseTranslation)),
                DataCell(Text(word.pronunciation)),
                DataCell(Text(word.phoneticSymbol)),
                DataCell(IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    setState(() {
                      selectedIndex = index;
                      wordController.text = word.word;
                      japaneseTranslationController.text = word.japaneseTranslation;
                      pronunciationController.text = word.pronunciation;
                      phoneticSymbolController.text = word.phoneticSymbol;
                    });
                    _showEditDialog(context, index);
                  },
                )),
              ]);
            }).toList(),
          ),
        ),
      ],
    );
  }

  void _showEditDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('単語情報編集'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: wordController,
                  decoration: InputDecoration(labelText: '単語'),
                ),
                TextField(
                  controller: japaneseTranslationController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: '日本語訳'),
                ),
                TextField(
                  controller: pronunciationController,
                  decoration: InputDecoration(labelText: '発音'),
                ),
                TextField(
                  controller: phoneticSymbolController,
                  decoration: InputDecoration(labelText: '発音記号'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // ダイアログを閉じる
              },
              child: Text('キャンセル'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  words[index].word = wordController.text;
                  words[index].japaneseTranslation = japaneseTranslationController.text;
                  words[index].pronunciation = pronunciationController.text;
                  words[index].phoneticSymbol = phoneticSymbolController.text;
                });
                Navigator.of(context).pop(); // ダイアログを閉じる
              },
              child: Text('保存'),
            ),
          ],
        );
      },
    );
  }
}
