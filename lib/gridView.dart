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
      home: _GridViweSection(),
    );
  }
}

class _GridViweSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const bgColor = const[Colors.blue,Colors.red,Colors.green];
    return Scaffold(
        body: GridView.builder(gridDelegate:
        SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          childAspectRatio: 4/3,
        ), itemBuilder: (ctx,i){
          return Container(
            alignment: Alignment.center,
            color: Colors.green,
            child: Text("$i"),
          );
        })
    );
  }
}

class _ListViewWithDividerSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const bgColor = const [Colors.blue, Colors.red, Colors.green];
    return Scaffold(
        body: ListView.separated(
          itemCount: 100,
          itemBuilder: (ctx, i) {
            return Container(
              height: 80,
              color: bgColor[i % 3],
            );
          },
          separatorBuilder: (ctx,i){
            return Divider(color: Colors.black,height: 1,);
          },
        ));
  }
}