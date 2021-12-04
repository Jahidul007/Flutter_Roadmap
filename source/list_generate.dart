import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String title = 'List generate';

    List<String> src = ["test1", "test2"];

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          title: Text(title),
          backgroundColor: const Color(0xffFA7343),
        ),
        body: Container(
          width: double.infinity,
          height: 500,
          // color: Colors.red,
          child: ListView(
            children: List<Widget>.generate(
              src.length,
              (index) {
                return Container(child: Text('${src[index]}'));
              },
            ),
          ),
        ),
      ),
    );
  }
}
