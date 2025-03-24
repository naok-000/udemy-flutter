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
  void showRobotResult() {
    List<String> hands = ["グー", "チョキ", "パー"];
    hands.shuffle();
    String hand = hands.first;

    Image image = Image.asset("assets/janken_gu.png");

    if (hand == "グー") {
      image = Image.asset("assets/janken_gu.png");
    } else if (hand == "チョキ") {
      image = Image.asset("assets/janken_choki.png");
    } else if (hand == "パー") {
      image = Image.asset("assets/janken_pa.png");
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(title: Text("ロボットくん"), content: image);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(
        child: ElevatedButton(onPressed: showRobotResult, child: Text("じゃんけん")),
      ),
    );
  }
}
