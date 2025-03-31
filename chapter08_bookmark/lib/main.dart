import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
  void pushPage({required String title, required String uri}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return WebView(title: title, uri: uri);
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
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                pushPage(title: 'Flutter', uri: 'https://flutter.dev');
              },
              child: Text('Flutter'),
            ),
            TextButton(onPressed: () {
              pushPage(title: 'Youtube', uri: 'https://youtube.com');
            }, child: Text('Youtube')),
            TextButton(onPressed: () {
              pushPage(title: 'Google', uri: 'https://google.com');
            }, child: Text('Google')),
          ],
        ),
      ),
    );
  }
}

class WebView extends StatefulWidget {
  const WebView({super.key, required this.title, required this.uri});

  final String title;
  final String uri;

  @override
  State<WebView> createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.uri));
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: SafeArea(child: WebViewWidget(controller: controller)),
    );
  }
}
