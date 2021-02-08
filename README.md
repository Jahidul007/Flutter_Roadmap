# Flutter_Road_Map_Documentation

![FlutterRoadmap](https://user-images.githubusercontent.com/26745548/99886366-1d9c4900-2c66-11eb-91d5-6991b97eb984.png)

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
 ## Issue and Error Handling
 * [How to solve “No implementation found for method showToast” in Flutter?](https://stackoverflow.com/questions/62286575/how-to-solve-no-implementation-found-for-method-showtoast-in-flutter)
 * [Flutter Multiple Blocs and NamedRoutes](https://stackoverflow.com/questions/61060354/flutter-multiple-blocs-and-namedroutes)
 * [StreamBuilder vs FlutterBuilder](https://stackoverflow.com/questions/50844519/flutter-streambuilder-vs-futurebuilder)
 * [`vsync` property in TabController constructor](https://stackoverflow.com/questions/46851245/vsync-property-in-tabcontroller-constructor)
 * [Difference Between Deactivate and Dispose?](https://stackoverflow.com/questions/56387243/difference-between-deactivate-and-dispose)


