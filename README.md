
# Flutter Project Architecture Documentation

## アーキテクチャ概要

このプロジェクトは、クリーンアーキテクチャを採用しています。

1. 責任の明確な分離
    - 各レイヤーが明確な責任を持ち、単一責任の原則に従う
    - 依存関係が内側に向かって一方向に制限する
    - 外部レイヤーの変更が内部レイヤーに影響を与えにくい構造とする

2. 依存性の方向
    - UI (Pages) → UseCase → Repository/Model → API
    - 各レイヤーは内側のレイヤーにのみ依存し、外側のレイヤーには依存しない

### オープンアーキテクチャのメリット

1. **保守性の向上**
    - レイヤー間の依存関係が明確で、修正の影響範囲が予測可能
    - 各レイヤーが独立しているため、特定の機能の修正が容易

2. **テスト容易性**
    - 各レイヤーが独立しているため、ユニットテストが書きやすい
    - モックやスタブの作成が容易

3. **拡張性**
    - 新機能の追加が既存コードに影響を与えにくい
    - 外部サービスの変更（例：Firebase以外のサービスへの移行）が容易

4. **チーム開発の効率化**
    - 役割分担が明確で、並行開発が可能
    - コードレビューの範囲が明確

## フォルダ構造の詳細

### 📁 pages/
UIの構築層を担当するディレクトリです。
- 画面のレイアウトとウィジェットの定義
- ユーザーインタラクションの受け付け
- UseCaseレイヤーとの連携
- 状態管理（State Management）の実装

```
pages/
  ├── home/
  │   ├── home_page.dart
  │   └── widgets/
  └── auth/
      ├── login_page.dart
      └── widgets/
```

### 📁 useCase/
画面ごとのビジネスロジックを管理するディレクトリです。
- 画面固有のビジネスロジックの実装
- Repository層とModel層の連携
- データの加工と検証
- ビジネスルールの適用

```
useCase/
  ├── home/
  │   └── home_use_case.dart
  └── auth/
      └── auth_use_case.dart
```

### 📁 repository/
外部データの取得と保存を担当するディレクトリです。
- データの永続化
- キャッシュの管理
- データソースの抽象化
- エラーハンドリング

```
repository/
  ├── user/
  │   └── user_repository.dart
  └── settings/
      └── settings_repository.dart
```

### 📁 model/
ビジネスエンティティとデータ変換を担当するディレクトリです。
- データモデルの定義
- データ変換（DTOからモデルへの変換など）
- バリデーションルール
- ビジネスルールの実装

```
model/
  ├── user/
  │   ├── user.dart
  │   └── user_dto.dart
  └── settings/
      └── settings.dart
```

### 📁 api/
外部サービス（Firebase）との通信を担当するディレクトリです。
- Firebase関連の処理
- API呼び出し
- データの送受信
- 認証処理

```
api/
  ├── firebase/
  │   ├── firebase_auth.dart
  │   └── firebase_store.dart
  └── config/
      └── api_config.dart
```

## 開発ガイドライン

1. レイヤー間の依存関係を必ず一方向に保つ
2. 各レイヤーの責任範囲を明確に保つ
3. 適切な抽象化とインターフェースの使用
4. テストカバレッジの維持
5. コードの可読性と保守性を重視

# ユーザー登録機能の実装例

この実装例は、クリーンアーキテクチャに基づいたユーザー登録機能のサンプルコードです。

## 📁 Pages層 - UI実装

```dart
// lib/pages/registration/registration_page.dart
import 'package:flutter/material.dart';
import '../useCase/registration/registration_use_case.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  
  final _registrationUseCase = RegistrationUseCase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ユーザー登録')),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: '名前'),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return '名前を入力してください';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'メールアドレス'),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'メールアドレスを入力してください';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'パスワード'),
                obscureText: true,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'パスワードを入力してください';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: _handleRegistration,
                child: Text('登録'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _handleRegistration() async {
    if (_formKey.currentState?.validate() ?? false) {
      try {
        await _registrationUseCase.register(
          name: _nameController.text,
          email: _emailController.text,
          password: _passwordController.text,
        );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('登録が完了しました')),
        );
        Navigator.of(context).pop();
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('登録に失敗しました: ${e.toString()}')),
        );
      }
    }
  }
}
```

## 📁 UseCase層 - ビジネスロジック

```dart
// lib/useCase/registration/registration_use_case.dart
import '../../model/user/user.dart';
import '../../repository/user/user_repository.dart';

class RegistrationUseCase {
  final UserRepository _userRepository = UserRepository();

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    // 入力値の検証
    if (!_isValidEmail(email)) {
      throw Exception('Invalid email format');
    }
    if (!_isValidPassword(password)) {
      throw Exception('Password must be at least 8 characters');
    }

    // ユーザーモデルの作成
    final user = User(
      id: '', // IDはFirebaseAuth登録時に生成される
      name: name,
      email: email,
      createdAt: DateTime.now(),
    );

    // リポジトリを通じてユーザー登録
    await _userRepository.createUser(user, password);
  }

  bool _isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  bool _isValidPassword(String password) {
    return password.length >= 8;
  }
}
```

## 📁 Repository層 - データアクセス

```dart
// lib/repository/user/user_repository.dart
import '../../model/user/user.dart';
import '../../api/firebase/firebase_auth.dart';
import '../../api/firebase/firebase_store.dart';

class UserRepository {
  final FirebaseAuth _auth = FirebaseAuth();
  final FirebaseStore _store = FirebaseStore();

  Future<void> createUser(User user, String password) async {
    // Firebase Authでユーザー作成
    final authResult = await _auth.createUser(user.email, password);
    
    // Firestoreにユーザー情報を保存
    final userWithId = user.copyWith(id: authResult.userId);
    await _store.setUser(userWithId);
  }
}
```

## 📁 Model層 - データモデル

```dart
// lib/model/user/user.dart
class User {
  final String id;
  final String name;
  final String email;
  final DateTime createdAt;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.createdAt,
  });

  User copyWith({
    String? id,
    String? name,
    String? email,
    DateTime? createdAt,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      createdAt: DateTime.parse(map['createdAt'] as String),
    );
  }
}
```

## 📁 API層 - 外部サービス連携

```dart
// lib/api/firebase/firebase_auth.dart
class FirebaseAuth {
  Future<AuthResult> createUser(String email, String password) async {
    // Firebase Authentication APIを使用してユーザーを作成
    try {
      // 実際のFirebase実装はここに記述
      // この例ではモック実装
      return AuthResult(userId: 'generated-user-id');
    } catch (e) {
      throw Exception('Failed to create user: ${e.toString()}');
    }
  }
}

class AuthResult {
  final String userId;
  
  AuthResult({required this.userId});
}

// lib/api/firebase/firebase_store.dart
class FirebaseStore {
  Future<void> setUser(User user) async {
    // Firestoreにユーザーデータを保存
    try {
      // 実際のFirestore実装はここに記述
      // この例ではモック実装
      await Future.delayed(Duration(milliseconds: 100));
    } catch (e) {
      throw Exception('Failed to save user data: ${e.toString()}');
    }
  }
}
```

## 実装のポイント

### 1. 各層の責任
- **Pages層**: UIの構築とユーザー入力の処理
- **UseCase層**: ビジネスロジックとバリデーション
- **Repository層**: データの永続化とAPI連携の統合
- **Model層**: データ構造の定義と変換
- **API層**: 外部サービスとの具体的な通信

### 2. エラーハンドリング
- 各層で適切なエラーハンドリングを実装
- ユーザーへのフィードバックを提供

### 3. データの流れ
1. UIからの入力を受け取る
2. UseCaseでバリデーションと処理
3. Repositoryを通じてデータを保存
4. API層で実際の外部サービスと通信

