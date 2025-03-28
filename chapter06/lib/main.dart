import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Map<String, String>> contacts = [
    {"name": '山田 太郎', "number": '070-1234-567', "address": "東京都"},
    {"name": '鈴木 一郎', "number": '080-1234-567', "address": "神奈川県"},
    {"name": '佐藤 花子', "number": '090-1234-567', "address": "大阪府"},
  ];

  void _pushPage({required Map<String, String> contact}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return DetailPage(contact: contact);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.phone),
            title: Text(contacts[index]['name']!),
            // ! ... null確定演算子（値がnullでないことを保証、無いとエラーになる）
            // 以下でも動作する
            // title: Text("${contacts[index]['name']}"),
            subtitle: Text(contacts[index]['number']!),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              _pushPage(contact: contacts[index]);
            },
          );
        },
      ),
      // 自分で考えた実装。これでもできる
      // body: ListView(
      //   children:
      //       contacts.map((contact) {
      //         return ListTile(
      //           leading: Icon(Icons.phone),
      //           title: Text("${contact['name']}"),
      //           subtitle: Text("${contact['number']}"),
      //           trailing: Icon(Icons.keyboard_arrow_right),
      //           onTap: () {
      //             _pushPage(contact: contact);
      //           },
      //         );
      //       }).toList(),
      // ),
    );
  }
}

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.contact});

  final Map<String, String> contact;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(contact["name"]!)),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                SizedBox(width: 30),
                Icon(Icons.account_circle, size: 40),
                Text(style: TextStyle(fontSize: 20), "名前：${contact['name']}"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                SizedBox(width: 30),
                Icon(Icons.phone, size: 40),
                Text(style: TextStyle(fontSize: 20), "電話：${contact['number']}"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                SizedBox(width: 30),
                Icon(Icons.home, size: 40),
                Text(
                  style: TextStyle(fontSize: 20),
                  "住所：${contact['address']}",
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(onPressed: () {}, child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.phone),
                Text("電話をかける"),
              ],
            )),
          ),
        ],
      ),
    );
  }
}
