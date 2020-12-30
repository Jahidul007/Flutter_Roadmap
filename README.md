# Flutter_Road_Map_Documentation

![FlutterRoadmap](https://user-images.githubusercontent.com/26745548/99886366-1d9c4900-2c66-11eb-91d5-6991b97eb984.png)

## Flutter Clean Architechture

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


