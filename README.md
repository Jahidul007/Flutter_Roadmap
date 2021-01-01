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

  directoryList.forEach((key, value) async {
    await directoryList[key].forEach((element) async {
      await makeFile("$key/$element/export"+"${element.toLowerCase()}s.dart");
    });
  });
}

void makeDir(String s) async {
  var dir = await Directory(s).create(recursive: true);
  print(dir.path);
}

void makeFile(String s) async {
  var dir = await File(s).create(recursive: true);
  print(dir.path);
}


```

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
* [Shimmer](https://pub.dev/packages/shimmer)
* [Staggered](https://pub.dev/packages/flutter_staggered_grid_view)
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


