import 'package:flutter/material.dart';

class FutureTestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  _do(){
    Future f1 = new Future((){
      print("我是第一个");
    });
    
    f1.then((value) => print("f1 then"));
    print("main");

  }

  _do2(){
    Future.delayed(Duration(seconds: 1),(){
      print("我是延迟的Future");
    });

    var future = Future.value("我是Future");
    future.then((value) => print(value));
  }

  _do3(){
    Future f1 = new Future(() => null);
    Future f2 = new Future(() => null);
    Future f3 = new Future(() => {print("创建f3")});
    f3.then((_) => print("我是f3"));

    f2.then((_) {
      print("我是f2");
      new Future(() => print("我是一个新的"));
      f1.then((_) {
        print("我是f1");
      });
    }).then((value) => print("我还是f2"));
  }
}
