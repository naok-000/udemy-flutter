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

  void _pushPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return NextPage();
        },
      ),
    ) ;
  }

  void _modalPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return NextPage();
        },
        fullscreenDialog: true
      ),
    ) ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          ElevatedButton(onPressed: _pushPage, child: Text("プッシュ遷移")),
          ElevatedButton(onPressed: _modalPage, child: Text("モーダル遷移")),
        ]),
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  const NextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("遷移先のページ")
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("遷移先のページです。")
          ],
        ),
      ),
    );
  }
}

