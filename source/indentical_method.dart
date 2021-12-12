import 'package:flutter/foundation.dart';
void main() {
 
  
  List l1 = [1, 2, 3, 4];
  List l2 = [1, 2, 3, 4];
  print(identical(l1, l2)); // false
  
  List l1 = [1, 2, 3, 4];
  List l2 = [1, 2, 3, 4];
  print(identical(l1.toString(), l2.toString()));
  
  List<int> l1 = [1, 2, 3,4];
  List<int> l2 = [1, 2, 3, 4];
  print(listEquals(l1, l2)); //true
}
