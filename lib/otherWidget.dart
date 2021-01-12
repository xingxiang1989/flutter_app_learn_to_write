import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: _CopyPasteView(),
    );
  }
}

///文本进行复制
///IconButton 是继承自StatelessWidget，相当于自定义view
///Wrap 流式布局，可以自动换行。比如Row 一行的元素满了之后，可以这样
///TextField 的外界边框要么可以使用内部的属性，要么在TextField中包裹一层更加简单点。可以看看别人怎么写的
class _CopyPasteView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const bgColor = const [Colors.blue, Colors.red, Colors.green];

    TextEditingController _controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Demo"),
      ),
        body: Container(
      child: Column(
        children: [
          SelectableText(
            "这是一个可复制的文本",
            toolbarOptions: ToolbarOptions(
                copy: true, selectAll: true, paste: true, cut: true),
          ),
          Wrap(
            children: [
              FlatButton(
                child: Text("FlatButton"),
                onPressed: () {
                  print("click FlatButton");
                },
              ),
              RaisedButton(
                child: Text("RaisedButton"),
                onPressed: () {
                  print("click RaisedButton");
                },
              ),
              OutlineButton(
                child: Text("OutlineButton"),
                onPressed: () {
                  print("click OutlineButton");
                },
              ),
              CupertinoButton(
                padding: EdgeInsets.all(2),
                color: Colors.blue,
                child: Text("CupertinoButton"),
                onPressed: () {
                  print("click CupertinoButton");
                },
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: Container(
                      padding: EdgeInsets.all(20),
                      color: Colors.grey,
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          hintText: "请输入",
                          hintStyle: TextStyle(fontSize: 16,color: Colors.grey[300]),
                        ),
                      ))),
              RaisedButton(
                child: Text("点击"),
                onPressed: () {
                  print("${_controller.text}");
                },
              )
            ],
          )
        ],
      ),
    ));
  }
}
