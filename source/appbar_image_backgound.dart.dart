import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var title = 'Web Images';
    
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          title: SizedBox(
            width: double.infinity,
            child: Image.asset('assets/images/test.jpg'),
          ),
          backgroundColor: const Color(0xffFA7343),
        ),
        body: Container(
        ),
      ),
    );
  }
}
