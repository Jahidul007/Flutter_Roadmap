# Flutter_Road_Map_Documentation

![Flutter-road-map](https://user-images.githubusercontent.com/26745548/143763624-8b33d260-bd4f-441b-879f-3a3ac20063b2.jpeg)

## Flutter Clean Architechture

#### Data
The Data layer consists of repository and data models. Repository is where the application gather all data related to the use case, either from local sources (Local DB, cookies) or remote sources (remote API). Data from the sources, usually in json format, is parsed to Dart object called models. It’s need to be done to make sure the application knows what data and variable it’s expecting.


#### Domain
Domain is the inner layer which shouldn’t be susceptible to the whims of changing data sources or porting our app to Angular Dart. It will contain only the core business logic (use cases) and business objects (entities).

Repository classes act as the Data Layer and Domain Layer, each function on the repository class acts as the domain layer that specifies the use cases of the feature.

#### Presentation
Presentation is where the UI goes. You obviously need widgets to display something on the screen. These widgets is controlled by the state using various state management design pattern used in Flutter. In this project, I use BLoC as the state management.

BLoC allows us to know exactly what data is given to the state. There is BLoC implementation that uses event classes to easily predict what state is the application in, but I use the simpler implementation of BLoC (just using streams) to shorten times for other that hasn’t been familiar to BLoC before. But I won’t dive too deep on BLoC because it’s another thing to write

![FLutter Clean Architechture](https://user-images.githubusercontent.com/56557098/103347921-9e9afb80-4ac2-11eb-8259-769d93bef2fd.jpg)

### Code to generate the folder pattern
```dart
import 'dart:convert';
import 'dart:io';

void main(List<String> arguments) async {
  Map<String, List<String>> directoryList = {
    'Data': [
      'RepositoryModels',
      'Repositories/LocalRepository',
      'Repositories/RemoteRepository',
    ],
    'Domain': [
      'Entities',
    ],
    'Presentation': [
      'Controllers',
      'Utilities',
      'Widgets',
      'Functions',
      'Language',
      'Pages',
    ],
  };
  //Add your the list of pages in your app/website

  List<String> pageList = [
    /*Sample List*/
    "OnBoardings",
    "Sign In",
    "Sign Up",
    "Home",
    "Item List",
    "Settings",
    "Help",
    "Chat"
  ];

  ///Creating the directories
  await directoryList.forEach((key, value) async {
    await directoryList[key].forEach((element) async {
      await makeFile("$key/$element/export" +
          "${element.replaceAll(' ', '_').toLowerCase()}.dart");
    });
  });

  ///Creating the Functions and Widgets directories in every pages
  await pageList.forEach((element) async {
    ///Create The Page Folder
    await makeFile("Presentation/Pages/" +
        "${element.toLowerCase()}/${element.replaceAll(' ', '_').toLowerCase()}Page.dart");

    ///Create The Page's Functions Folder
    await makeFile(
        "Presentation/Pages/${element.toLowerCase()}/Functions/${element.replaceAll(' ', '_').toLowerCase()}Functions.dart");

    ///Create The Page's Widgets Folder
    await makeFile(
        "Presentation/Pages/${element.toLowerCase()}/Widgets/${element.replaceAll(' ', '_').toLowerCase()}Widgets.dart");

    ///Add The page in the export file
    await File("Presentation/Pages/exportpages.dart").writeAsStringSync(
      "export '${element.toLowerCase()}/${element.replaceAll(' ', '_').toLowerCase()}Page.dart';\n",
      mode: FileMode.append,
    );
  });

  // print("Export Pages:\n" + exportPages);
}

makeDir(String s) async {
  var dir = await Directory(s).create(recursive: true);
  // print(dir.path);
}

makeFile(String s) async {
  var dir = await File(s).create(recursive: true);
  // print(dir.path);
}


```

## Feature Driven Project Architecture
      ├── lib
      |   ├── posts
      │   │   ├── bloc
      │   │   │   └── post_bloc.dart
      |   |   |   └── post_event.dart
      |   |   |   └── post_state.dart
      |   |   └── models
      |   |   |   └── models.dart*
      |   |   |   └── post.dart
      │   │   └── view
      │   │   |   ├── posts_page.dart
      │   │   |   └── posts_list.dart
      |   |   |   └── view.dart*
      |   |   └── widgets
      |   |   |   └── bottom_loader.dart
      |   |   |   └── post_list_item.dart
      |   |   |   └── widgets.dart*
      │   │   ├── posts.dart*
      │   ├── app.dart
      │   ├── simple_bloc_observer.dart
      │   └── main.dart
      ├── pubspec.lock
      ├── pubspec.yaml
The application uses a feature-driven directory structure. This project structure enables us to scale the project by having self-contained features. In this example we will only have a single feature (the post feature) and it's split up into respective folders with barrel files, indicated by the asterisk (*).

## Reactive Programming with MVVM pattern
It basically consists of three layers where the View which consists of all UI elements you see on the screen. It can also contain logic that only concerns the UI. The Model contains your business logic and backend connections. The ViewModel is the glue between both in that it processes and transforms data from the Model to a form the View can easily display. It offers functions (often called Commands) the View can call to trigger actions on the Model and provides events to signal the View about data changes.

Important: The ViewModel knows nothing about the View which makes it testable and more than one View can use the same ViewModel. A ViewModel just offers services to the View (events, commands). The _View decides which it uses.

**"Several MVVM frameworks encapsulate the subscription of events and calling functions to update data in the ViewModel from the View using DataBindings"**

To trigger any other action in the View besides data updates from the ViewModel gets tedious because you have to publish events and functions if the View should be able to retrieve data as a result of the event.

Another problem is that we always moving state between the different layers which have to be kept in sync.

What we really want is an App that just reacts on any event from the outside without having to deal with state management all the time.

![MVVM](https://user-images.githubusercontent.com/26745548/103972805-fa871380-5197-11eb-9275-1ce108c3e499.png)


## Courses
* [The Complete 2020 Flutter Development Bootcamp with Dart](https://www.udemy.com/course/flutter-bootcamp-with-dart/)
* [Santos Enoque](https://www.youtube.com/channel/UCRl79zOEtiLCglAFZJJzEZQ)
## Documents
* [Official Flutter](https://flutter.dev/)
* [Flutter Flow](https://flutterflow.io/)
* [How can you change the default ScrollPhysics in flutter?](https://stackoverflow.com/questions/62809540/how-can-you-change-the-default-scrollphysics-in-flutter)
* [Generate Dynamic Card](https://mirfahim.medium.com/how-to-generate-dynamic-card-in-flutter-with-listview-builder-and-floatingactionbutton-f925ec8e81a5)
* [How to remove scroll glow?](https://stackoverflow.com/questions/51119795/how-to-remove-scroll-glow)
* [GetX](https://pub.dev/packages/get)
* [Provider](https://pub.dev/packages/provider)
* Flutter bloc: <br/>
 ** [Documents](https://bloclibrary.dev/#/flutterbloccoreconcepts)<br/>
 ** [Source Code](https://github.com/Jahidul007/hacker_news) <br/>
 ** [Video](https://www.youtube.com/watch?v=27EP04T824Y&ab_channel=CODEVILLAGE) 
* [Shimmer](https://pub.dev/packages/shimmer)
* [Staggered](https://pub.dev/packages/flutter_staggered_grid_view)
* Reactive Programming or RxDart: <br/>
 ** [Source Code](https://github.com/Jahidul007/Movie_App) <br/>
 ** [Video](https://www.youtube.com/watch?v=x4FKXw4Uvls&list=PL_Wj0DgxTlJc8E3ulwdekyVI4Wc819azh&index=1&ab_channel=ProgrammingAddict) 
* [sync*, async*, yield, and yield*](https://jelenaaa.medium.com/what-are-sync-async-yield-and-yield-in-dart-defe57d06381)
* [Flutter keys](https://youtu.be/kn0EOS-ZiIc)
* [Multiscreen app](https://medium.com/flutter-community/clean-navigation-in-flutter-using-generated-routes-891bd6e000df)
* [in flutter page textfield hidden by keyboard](https://stackoverflow.com/questions/54196213/in-flutter-page-textfield-hidden-by-keyboard)
* [Measuring your app's size](https://flutter.dev/docs/perf/app-size)
* [Dropdown search](https://pub.dev/packages/dropdown_search)
* [Flutter push notification step by step](https://www.freecodecamp.org/news/how-to-add-push-notifications-to-flutter-app/)
## code Snippet
* Dismissable item from listview onClick

```dart
onClick:(){
  removeItem(index);
}

 void removeItem(index) {
    setState(() {
      groupData.removeAt(index);
    });
  }
```
N.B: Must be followed stateful widget. 

* Reorderable List
```dart
 void onReorder(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }
    setState(() {
      String game = topTenGames[oldIndex];

      topTenGames.removeAt(oldIndex);
      topTenGames.insert(newIndex, game);
    });
  }
  ```
  
  * iso8601 date/time convert to standard format
```dart
 var date = "2021-03-24T08:57:47.812" 
 var dateTime =  DateTime.parse("${date.substring(0,16)}");
 var stdTime =  DateFormat('MMM d, yy hh:mm a').format(dateTime).toString();
  ```
  
  * convert tiem to local 
   ```
   var dateFormat = DateFormat("dd-MM-yyyy hh:mm aa"); // you can change the format here
var utcDate = dateFormat.format(DateTime.parse(uTCTime)); // pass the UTC time here
var localDate = dateFormat.parse(utcDate, true).toLocal().toString();
String createdDate = dateFormat.format(DateTime.parse(localDate)); 
   ```
   
   * List to map of map 
   ```
   List<String> _options = [
    'Arts & entertainment',
    'Biographies & memoirs',
  ];
  
  List<bool> _isOptionSelected = [
    false,
    false,
  ];
  

  
  Map<String, dynamic> map =  _options.asMap().map((key,value)=>MapEntry(value,{
    'optionName':value,
    'isOptionSelected':_isOptionSelected[key]
  }));
   ```
   * map of map to list 
   ```
   
List<String> _options = [];
    List<bool> _isOptionSelected = [];
    Map<String, Map<String, dynamic>> _isOptionMap = {
      'Arts & entertainment': {
        'optionName': 'Arts & entertainment',
        'isOptionSelected': false,
      },
      'Biographies & memoirs': {
        'optionName': 'Biographies & memoirs',
        'isOptionSelected': false,
      },
    };
    _isOptionMap.forEach((key, value) {
        _options.add(value['optionName']);
        _isOptionSelected.add(value['isOptionSelected']);
      
    });
    print(_options);
    print(_isOptionSelected);
   ```
   * How can I limit the size of a text field in flutter?
   ```
   TextEditingController _controller = new TextEditingController();
String text = ""; // empty string to carry what was there before it 
onChanged
int maxLength = ...
...
new TextField(
    controller: _controller,
    onChange: (String newVal) {
        if(newVal.length <= maxLength){
            text = newVal;
        }else{
            _controller.value = new TextEditingValue(
                text: text,
                selection: new TextSelection(
                    baseOffset: maxLength,
                    extentOffset: maxLength,
                    affinity: TextAffinity.downstream,
                    isDirectional: false
                ),
                composing: new TextRange(
                    start: 0, end: maxLength
                )
            );
            _controller.text = text;
        } 
    }
);
   ```
   
   * Date picker with time 
   ```
   DateTimePicker(
                      type: DateTimePickerType.dateTimeSeparate,
                      dateMask: 'yyyy-MM-dd',
                      initialValue: DateTime.now().toString(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                      icon: Icon(Icons.event),
                      dateLabelText: 'Date',
                      timeLabelText: "Hour",

                      onChanged: (val) {
                        var date = val.substring(0,10);
                        var time = val.substring(11);
                        reportBloc.updateFromDate(date+"T"+time+":00.000Z");
                      },
                      validator: (val) {
                        return null;
                      },
                      onSaved: (val) {
                        reportBloc.updateFromDate(val);
                      },
                    ),
   ```
   * initialize alertBox when app open
   ```
   WidgetsBinding.instance.addPostFrameCallback((_) async {
      await showDialog(
        context: context,
        builder: (BuildContext context) => AnimatedPadding(
          padding: MediaQuery.of(context).viewInsets,
          duration: const Duration(milliseconds: 100),
          curve: Curves.decelerate,
          child: LoadingWrap(
            padding: EdgeInsets.all(20),
            children: [
              new AlertDialog(
                insetPadding: EdgeInsets.all(20),
                contentPadding: EdgeInsets.all(0),
                content: Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  child: SingleChildScrollView(
                    child: ListBody(
                      children: <Widget>[
                       -------------
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                actions: <Widget>[],
              )
            ],
          ),
        ),
      );
    });
   ```
   
   * Tooltip onTap rather than onLongPress possible?
   ```
   GestureDetector(
            onTap: () {
              final dynamic _toolTip = _toolTipKey.currentState;
              _toolTip.ensureTooltipVisible();
            },
            child: Tooltip(
              key: _toolTipKey,
              waitDuration: Duration(seconds: 1),
              showDuration: Duration(seconds: 2),
              padding: EdgeInsets.all(5),
              height: 16,
              message: widget.message??"testing tooltip",
              child: SvgPicture.asset("images/ic_info.svg"),),
          ),
        ],),
      )
      
 ```
* Get Customize phone number format
 ```
 //flutter_masked_text: ^0.8.0
 import 'package:flutter_masked_text/flutter_masked_text.dart';
 
 String getPhoneNumber(String phoneNum)  {
  var controller = new MaskedTextController(text: '', mask: '000-0000');
  controller.updateText(phoneNum);
  return controller.text.length >=1 ?"1-868-"+controller.text:"Not Available";
}
 ```
 * swap list value
 ```
 balanceTransferDescription
          .where((element) => element.name.toLowerCase().contains("other"))
          .forEach((element) {
        balanceTransferDescription.remove(element);
        balanceTransferDescription.insert(
            balanceTransferDescription.length, element);
 ```
* Capitalize first letter of the first word for each sentence
```
String capitalizeSentence(String s) {
  // Each sentence becomes an array element
  var sentences = s.split('.');
  // Initialize string as empty string
  var output = '';
  // Loop through each sentence
  for (var sen in sentences) {
    // Trim leading and trailing whitespace
    var trimmed = sen.trim();
    // Capitalize first letter of current sentence
    var capitalized = "${trimmed[0].toUpperCase() + trimmed.substring(1)}";
    // Add current sentence to output with a period
    output += capitalized + ". ";
  }
  return output;
}
```
* Dart remove all brackets with integers between them
```
String s = "Hello, world![1] i am 'foo' [100]";
print(s.replaceAll(new RegExp(r'\s*\[\d+]'),''));
```
* Remove duplicate value from map
```
import 'dart:collection';

void main() {
  List users = [
    {"userEmail": "tintu@gmail.com"},
    {"userEmail": "john@gmail.com"},
    {"userEmail": "tintu@gmail.com"},
    {"userEmail": "rose@gmail.com"},
    {"userEmail": "john@gmail.com"},
  ];

  var finalList = [
    ...LinkedHashSet(
      equals: (user1, user2) => user1['userEmail'] == user2['userEmail'],
      hashCode: (user) => user['userEmail'].hashCode,
    )..addAll(users)
  ];
  print(finalList);
}
```

* Call secondary color from theme data 
```
// define theme
theme: ThemeData(
          primaryColor: Colors.black,
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: Colors.green,
          ),
        ),
 // call color 
 color: Theme.of(context).colorScheme.secondary
```
            
 ## Issue and Error Handling
 * [How to solve “No implementation found for method showToast” in Flutter?](https://stackoverflow.com/questions/62286575/how-to-solve-no-implementation-found-for-method-showtoast-in-flutter)
 * [Flutter Multiple Blocs and NamedRoutes](https://stackoverflow.com/questions/61060354/flutter-multiple-blocs-and-namedroutes)
 * [StreamBuilder vs FlutterBuilder](https://stackoverflow.com/questions/50844519/flutter-streambuilder-vs-futurebuilder)
 * [`vsync` property in TabController constructor](https://stackoverflow.com/questions/46851245/vsync-property-in-tabcontroller-constructor)
 * [Difference Between Deactivate and Dispose?](https://stackoverflow.com/questions/56387243/difference-between-deactivate-and-dispose)
 * [Populating stepper content based](https://stackoverflow.com/questions/59130685/flutter-populating-steps-content-based-on-previous-selection-on-stepper)
 * [How to build dependent dropdown menus in Flutter?](https://stackoverflow.com/questions/60323767/multiple-dependent-dropdown-in-flutter)
 * [Flutter building apk: Duplicate class found in modules guava-26.0-android.jar and listenablefuture-1.0.jar](https://stackoverflow.com/questions/63711300/flutter-building-apk-duplicate-class-found-in-modules-guava-26-0-android-jar-an)
 * [Exception: Concurrent modification during iteration: Instance(length:17) of '_GrowableList'](https://stackoverflow.com/questions/22409666/exception-concurrent-modification-during-iteration-instancelength17-of-gr)
 * [regular-expressions with number](https://www.oreilly.com/library/view/regular-expressions-cookbook/9781449327453/ch06s07.html)
 * Unable to import module app_setings or missing your manifest.lock in Xcode - Flutter
     > Try the following steps in terminal:
         > flutter pub get
         > pod init
         > pod install
      


