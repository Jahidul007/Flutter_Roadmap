import 'package:flutter/material.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var List1 = {
    'title': true,
    'open': false,
    'title2': true,
    'open2': false,
    'title3': true,
    'open3': false,
    'title4': true,
    'open4': false,
    'title5': true,
    'open5': false,
  };

  List<String> List2 = [
    'Bubble Football ⚽',
    'Futsal 🧿',
    'Beach Volleyball 🏐',
    'Volleyball 🏐',
    'Dodgeball 🏀',
    'Rugby 🏉',
    'American Footbal 🏈',
    'Korftbal 🥎',
    'Netbal ⚾',
  ];

  List<bool> _isOpen = [true, false];

  List<int> _selected_box = List();
  int selectItem;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.light().copyWith(primary: Colors.tealAccent),
      ),
      home: SafeArea(
        child: Scaffold(
            backgroundColor: Theme.of(context).colorScheme.primary,
            appBar: AppBar(
              title: Text("Title of the App"),
            ),
            body: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ExpansionPanelList(
                          children: List.generate(
                            List2.length,
                            (index) => expansionPanel(
                                _selected_box.contains(index),
                                "${List2[index]}"),
                          ),
                          expansionCallback: (i, isOpen) {
                            setState(() {
                              if (_selected_box.contains(i))
                                _selected_box.remove(i);
                              else
                                _selected_box.add(i);
                            });
                          },
                        )
                      ],
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }

  ExpansionPanel expansionPanel(bool isbool, String expansionTitle) {
    return ExpansionPanel(
      isExpanded: isbool ?? false,
      headerBuilder: (context, isOpen) {
        return Row(
          children: [
            SizedBox(width: 10),
            Center(
              child: Text(
                "$expansionTitle",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff333333)),
              ),
            ),
          ],
        );
      },
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _myListView(),
            // _myListView(),
          ],
        ),
      ),
    );
  }

  Widget _myListView() {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: ListView(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        children: List1.keys.map((String key) {
          return CheckboxListTile(
            title: Text(key),
            value: List1[key],
            activeColor: Colors.black,
            checkColor: Colors.white,
            onChanged: (bool value) {
              setState(() {
                List1[key] = value;
              });
            },
          );
        }).toList(),
      ),
    );
  }
}
