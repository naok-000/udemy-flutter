import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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

  String areaName = '';
  String weather = '';
  double temperature = 0.0;
  int humidity = 0;
  double temperatureMax = 0;
  double temperatureMin = 0;


  Future<void> loadWeather(String location) async {
    final _key = ''; // 各自のAPIキーを入力してください
    String _uri = 'https://api.openweathermap.org/data/2.5/weather?appid=${_key}&lang=ja&units=metric&q=${location}';

    final res = await http.get(Uri.parse(_uri));
    if(res.statusCode != 200){
      return;
    }
    print(res.body);
    final body = json.decode(res.body) as Map<String, dynamic>;
    setState(() {
      areaName = body['name'];
      weather = (body['weather']?[0]?['description'] ?? '') as String;
      humidity = (body['main']['humidity'] ?? 0) as int;
      temperature = (body['main']['temp'] ?? 0) as double;
      temperatureMax = (body['main']['temp_max'] ?? 0) as double;
      temperatureMin = (body['main']['temp_min'] ?? 0) as double;

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: (value) {
            if (value.isNotEmpty) {
              loadWeather(value);
            }
          },
          decoration: InputDecoration(labelText: '地域を入力（アルファベット）'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            ListTile(title: Text('地域'), subtitle: Text(areaName)),
            ListTile(title: Text('天気'), subtitle: Text(weather)),
            ListTile(title: Text('湿度'), subtitle: Text(temperature.toString())),
            ListTile(title: Text('最高温度'), subtitle: Text(temperatureMax.toString())),
            ListTile(title: Text('最低温度'), subtitle: Text(temperatureMin.toString())),
            ListTile(title: Text('湿度'), subtitle: Text(humidity.toString())),
          ],
        ),
      ),
    );
  }
}
