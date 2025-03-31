import 'package:flutter/material.dart';
import 'dart:math';

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
      home: NumberGuessGame(),
    );
  }
}

class NumberGuessGame extends StatefulWidget {
  const NumberGuessGame({super.key});

  @override
  State<NumberGuessGame> createState() => _NumberGuessGameState();
}

class _NumberGuessGameState extends State<NumberGuessGame> {
  @override
  int _number = Random().nextInt(100) + 1; // 1 <= number <= 100;
  int _count = 0;
  String _msg = '私が思い浮かべている数字は何でしょうか？(1~100)';

  void _initNumber() {
    _number = Random().nextInt(100) + 1; // 1 <= number <= 100
    _count = 0;
  }

  final TextEditingController _controller = TextEditingController();

  void _guessNumber() {
    _count++;
    int? userGuess = int.tryParse(_controller.text);

    if (userGuess == null || userGuess <= 0 || userGuess > 100) {
      _msg = '1から100の数値を入れてください。';
      setState(() {
        _controller.clear();
      });
      return;
    } else if (_number == userGuess) {
      _msg = 'おめでとうございます！「$userGuess」で正解です！\n$_count回目で当てました。\n新しい数字を思い浮かべます。';
      _initNumber();
    } else if (_number < userGuess) {
      _msg = '「$userGuess」は大きすぎます！もう一度試してみてください。';
    } else if (_number > userGuess) {
      _msg = '「$userGuess」は小さすぎます！もう一度試してみてください。';
    }
    setState(() {
      _controller.clear();
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('数字あてゲーム')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_msg, style: TextStyle(fontSize: 20),),
            TextField(controller: _controller, keyboardType: TextInputType.number, decoration: InputDecoration(labelText: 'あなたの予想を入力してください'),),
            ElevatedButton(onPressed: _guessNumber, child: Text('予想を回答する')),
          ],
        ),
      ),
    );
  }
}
