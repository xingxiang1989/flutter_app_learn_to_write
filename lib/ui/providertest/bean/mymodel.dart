
import 'package:flutter/cupertino.dart';

/// Future 还没有理解
/// async await
///
class MyModel with ChangeNotifier{

  MyModel({this.counter=0});

  int counter = 0;

  // Future<void> incrementCounter() async {
  //   await Future.delayed(Duration(seconds: 2));
  //   counter++;
  //   print(counter);
  //   notifyListeners();
  // }


   incrementCounter() {
    counter++;
    print(counter);
    notifyListeners();
  }
}