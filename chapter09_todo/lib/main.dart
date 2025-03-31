import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

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
  List<Item> items = [];
  final TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    watch();
  }

  // データ更新を監視
  Future<void> watch() async {}

  // 保存する
  Future<void> save() async {}

  // 完了・未完了に変更する
  Future<void> complete() async {}

  // 削除する
  Future<void> delete() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

class Item {
  const Item({required this.id, required this.text});

  final String id;
  final String text;

  factory Item.fromSnapshot(String id, Map<String, dynamic> document) {
    return Item(id: id, text: document['text'].toString() ?? '');
  }
}
