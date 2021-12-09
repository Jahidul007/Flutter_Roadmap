import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
        child: FutureBuilder(
          future: fetchHTML('https://google.com'),
          builder: (context,  snapshoot){
            return snapshoot.hasData?Html(
              data: snapshoot.data,
            ):Container();
          },
        ));
  }
}

Future<String> fetchHTML(String url1) async {
  var url = Uri.parse(url1);
  final response = await http.get(url);

  if (response.statusCode == 200)
    return response.body;
  else throw Exception('Failed');
}
