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
      home: HomePage(),
    );
  }
}

///全屏的壁纸效果，例如设置背景图
class _fullScreenSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage("https://ss3.bdstatic"
                    ".com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=226419046,487093019&fm=26&gp=0.jpg"),
                fit: BoxFit.fill)),
        child: Text(
          "hello world 22",
          style: TextStyle(fontSize: 10),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool _isShow = true;

  @override
  Widget build(BuildContext context) {
    print("build");

    return Scaffold(
      body: Container(
        // constraints: BoxConstraints.expand(),
        alignment: Alignment.topLeft,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage("https://ss3.bdstatic"
                    ".com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=226419046,487093019&fm=26&gp=0.jpg"),
                fit: BoxFit.fill)),
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 60, left: 20, right: 20),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color.fromRGBO(0, 0, 0, 0.5)),
          child: Column(
            //线性布局，主轴默认是铺满全屏
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "这是标题",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              //用于控制widget是否隐藏显示。。。
              Visibility(
                visible: _isShow,
                  child: Image.asset(
                "images/lake.jpg",
                fit: BoxFit.cover,
              )),
              IconButton(
                icon: Icon(
                  _isShow?Icons.arrow_drop_down: Icons.arrow_drop_up,
                  color: Colors.white,
                  size: 40.0
                ),
                onPressed: () {
                  print("onPressed");
                  setState(() {
                    _isShow = !_isShow;
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
