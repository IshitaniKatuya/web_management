import 'package:flutter/material.dart';
import 'package:web_management_pj/pages/words_table.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '単語管理アプリ',
      debugShowCheckedModeBanner: false,  // デバッグバナーを非表示
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          primary: Colors.blue[700]!,
          surface: Colors.white,
          background: Colors.white,
          brightness: Brightness.light,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue[700],
          foregroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      home: const WordListPage(),
    );
  }
}

class WordListPage extends StatelessWidget {
  const WordListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('単語情報テーブル'),
        actions: [
          // 必要に応じてアクションボタンを追加
          IconButton(
            icon: const Icon(Icons.help_outline),
            onPressed: () {
              // ヘルプ機能の実装
            },
          ),
        ],
      ),
      body:  SafeArea(
        child: WordsTable(),
      ),
    );
  }
}