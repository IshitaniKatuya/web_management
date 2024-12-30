import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_management_pj/pages/words_table.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '単語管理アプリ',
      debugShowCheckedModeBanner: false,
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

// ヘルプ機能の状態管理用プロバイダー
final helpVisibilityProvider = StateProvider<bool>((ref) => false);

class WordListPage extends ConsumerWidget {
  const WordListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showHelp = ref.watch(helpVisibilityProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('単語情報テーブル'),
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline),
            onPressed: () {
              ref.read(helpVisibilityProvider.notifier).state = !showHelp;
              if (showHelp) {
                // ヘルプ表示のロジック
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('ヘルプ'),
                    content: const SingleChildScrollView(
                      child: Text(
                          '単語情報テーブルの使い方：\n\n'
                              '• 各行は1つの単語の情報を表しています\n'
                              '• チェックボックスで各項目を設定できます\n'
                              '• 編集アイコンで単語の情報を編集できます'
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('閉じる'),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ],
      ),
      body: SafeArea(
        child: WordsTable(),
      ),
    );
  }
}