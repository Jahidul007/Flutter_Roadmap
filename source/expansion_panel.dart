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
  List<String> chipNames = [
    "time with friend and family hurrrrrrrrrrh 3495872039847 0239487502 0234857 08 02948357092834 ",
    "healthy device usage and test",
    "Eating healthy",
    "Pulse checks",
    "Exercise",
    "Serving others"
  ];

  List<bool> _isOpen = [true, false];

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
                Container(
                  height: 200,
                  color: Colors.green,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [

                        ExpansionPanelList(
                          children: [
                            ExpansionPanel(
                              isExpanded: _isOpen[0],
                              headerBuilder: (context, isOpen) {
                                return Text("Activities");
                              },
                              body: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  _myListView(),
                                  // _myListView(),
                                ],
                              ),
                            ),
                            ExpansionPanel(
                              isExpanded: _isOpen[1],
                              headerBuilder: (context, isOpen) {
                                return Text("Ports");
                              },
                              body: Text("Test!!!"),
                            )
                          ],
                          expansionCallback: (i, isOpen) {
                            setState(() {
                              _isOpen[i] = !isOpen;
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

  SelectableChip({String label}) {
    return Text("$label");
  }
  Widget _myListView() {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: ListView(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        children: List1.keys.map((String key) {
          return new CheckboxListTile(
            title: new Text(key),
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
