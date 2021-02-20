import 'package:flutter/material.dart';
import 'package:flutterapplearntowrite/util/LogUtils.dart';
import 'package:flutterapplearntowrite/widget/count_Inherited_widget.dart';
import 'package:flutterapplearntowrite/widget/count_text.dart';
///InheritedWidget 是 Flutter 中的一个非常重要的功能组件，它能够提供数据在 widget 树中从上到下进行传递。
///保证数据在不同子 widget 中进行共享。这对于一些需要使用共享数据的场景非常有效，
///例如，在 Flutter SDK 中就是通过 InheritedWidget 来共享应用的主题与语言信息。
class CountPage extends StatefulWidget {
  @override
  _CountPageState createState() => _CountPageState();
}

class _CountPageState extends State<CountPage> {
  ValueNotifier<int> _num = new ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    LogUtils.d("CountPage", "Build--->");
    return MaterialApp(
      title: 'Count App',
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Count"),
        ),
        body: Center(
          child: CountInheritedWidget(
            num: _num,
            child: ValueListenableBuilder<int>(
              valueListenable: _num,
              builder: (BuildContext context, int value, Widget child) {
                LogUtils.d("CountPage", "局部刷新--->");
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CountText(),
                    RaisedButton(
                      onPressed: () => _num.value ++,
                      child: Text("Increment " + value.toString()),
                    )
                  ],
                );
              }
            ),
          ),
        ),
      ),
    );
  }
}
