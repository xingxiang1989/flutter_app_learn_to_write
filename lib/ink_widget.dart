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
      home: _WaterButton(),
    );
  }
}

///自定义按钮，实现点击出现水波纹，首先布局层级，最后面写的在最上面，于是先是装饰红色部分，然后是水波纹
class _WaterButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const bgColor = const [Colors.blue, Colors.red, Colors.green];
    return Scaffold(
        appBar: AppBar(
          title: Text("title"),
        ),
        body: Center(
          child: Ink(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFFDE2F21), Color(0xFFEC592F)]),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: InkWell(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 8),
                child: Text(
                  "这是一个button",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              onTap: () {
                print("onTap--->");
              },
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
          ),
        ));
  }
}
