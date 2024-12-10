import 'package:flutter/material.dart';

class User {
  final String id;
  String name;
  int age;
  String hobby;

  User({required this.id, required this.name, required this.age, required this.hobby});
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
          title: Text('ユーザー情報テーブル'),
        ),
        body: UserTable(),
      ),
    );
  }
}

class UserTable extends StatefulWidget {
  @override
  _UserTableState createState() => _UserTableState();
}

class _UserTableState extends State<UserTable> {
  List<User> users = [
    User(id: '001', name: '佐藤 太郎', age: 25, hobby: '読書'),
    User(id: '002', name: '鈴木 次郎', age: 30, hobby: '映画鑑賞'),
    User(id: '003', name: '高橋 三郎', age: 22, hobby: '音楽'),
  ];

  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController hobbyController = TextEditingController();
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
              DataColumn(label: Text('名前')),
              DataColumn(label: Text('年齢')),
              DataColumn(label: Text('趣味')),
              DataColumn(label: Text('編集')),
            ],
            rows: users.map((user) {
              int index = users.indexOf(user);
              return DataRow(cells: [
                DataCell(Text(user.id)),
                DataCell(Text(user.name)),
                DataCell(Text(user.age.toString())),
                DataCell(Text(user.hobby)),
                DataCell(IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    setState(() {
                      selectedIndex = index;
                      nameController.text = user.name;
                      ageController.text = user.age.toString();
                      hobbyController.text = user.hobby;
                    });
                  },
                )),
              ]);
            }).toList(),
          ),
        ),
        if (selectedIndex != null) ...[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('編集'),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: '名前'),
                ),
                TextField(
                  controller: ageController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: '年齢'),
                ),
                TextField(
                  controller: hobbyController,
                  decoration: InputDecoration(labelText: '趣味'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      users[selectedIndex!].name = nameController.text;
                      users[selectedIndex!].age = int.parse(ageController.text);
                      users[selectedIndex!].hobby = hobbyController.text;
                      selectedIndex = null;
                    });
                  },
                  child: Text('保存'),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }
}
