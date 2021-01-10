import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness:Brightness.light,
      statusBarIconBrightness: Brightness.dark

  ));
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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    // return Scaffold(
    //     body: new ListView(children: [
    //   // _ImageSelection(),
    //   // _FlexSelection(),
    //   //     _coverDescriptionSection(),
    //   //     _settingSection(),
    //   // _titleSectionWidget(),
    //   // _ButtonGroupSelection(),
    //   // _ContentSelection(),
    //   //     _fullScreenSection(),
    // ]));

    return _fullScreenSection();
  }
}

class _titleSectionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.only(top: 0.0),
      color: Colors.grey,
      child: new Row(
        children: [
          new Expanded(
              child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              new Text(
                'Oeschinen Lake Campground',
                style: new TextStyle(fontSize: 18.0, color: Colors.lightBlue),
              ),
              new Text(
                "learn to write",
                style: new TextStyle(
                    fontSize: 18.0, color: Colors.deepPurpleAccent),
              )
            ],
          )),
          new Icon(Icons.star, color: Colors.red, size: 20.0),
          new Text(
            "41",
            style: new TextStyle(fontSize: 16.0, color: Colors.red),
          )
        ],
      ),
    );
  }
}

class _ButtonGroupSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.all(Radius.circular(18.0))
            
      ),
      padding: EdgeInsets.only(bottom: 10.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _GetButtonColumn(Icons.call, 'CALL'),
          _GetButtonColumn(Icons.near_me, 'ROUTE'),
          _GetButtonColumn(Icons.share, 'SHARE'),
        ],
      ),
    );
  }
}

class _GetButtonColumn extends StatelessWidget {
  IconData iconData;
  String label;
  Color color;

  _GetButtonColumn(this.iconData, this.label) {
    color = Colors.lightBlue;
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          new Icon(iconData, color: color, size: 20.0),
          new Text(
            label,
            style: new TextStyle(color: color, fontSize: 18.0),
          )
        ],
      ),
    );
  }
}

class _ContentSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
        padding: EdgeInsets.all(32.0),
        color: Colors.lime,
        child: new Text(
          "四列元素中的三个现在已经完成，只剩下图像部分。该图片可以在Creative Commons许可下在线获得， 但是它非常大，且下载缓慢。在步骤0中，您已经将该图像包含在项目中并更新了pubspec文件，所以现在可以从代码中直接引用它：",
          style: new TextStyle(fontSize: 16.0, color: Colors.black),
          softWrap: true,
        ));
  }
}

class _ImageSelection extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return new ConstrainedBox(
//        constraints: BoxConstraints.expand(),
//        child: new Image.asset("images/lake.jpg", fit: BoxFit.fill, height:
//        300.0,));
//  }

  @override
  Widget build(BuildContext context) {
    return new Image.asset('images/lake.jpg', fit: BoxFit.cover, height: 300.0);
  }
}

///弹性布局的实践，一般以后会采用Row，cloumn
class _FlexSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const bgColor = const[Colors.blue,Colors.red,Colors.green];
    return Container(
      child: Flex(
        direction: Axis.horizontal,
        children: List<Widget>.generate(3, (index) =>
            Container(
              width: 100,
              height: 100,
              color: bgColor[index],
            )),
      ),
    );
  }
}

///给图片设置成圆角，并为其底部添加半透明浮层和文字介绍
class _coverDescriptionSection extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10.0)) ,
              child: FadeInImage.assetNetwork(
                  placeholder: 'images/lake.jpg',
                  image: "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fa4.att.hudong.com%2F27%2F67%2F01300000921826141299672233506.jpg&refer=http%3A%2F%2Fa4.att.hudong.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1612833279&t=0d184c525120a5d6b3a643be503fb7a2",
                  fit:BoxFit.cover),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Container(
              height: 60,
              padding: EdgeInsets.only(left:10.0,top: 0.0,right:0.0,bottom: 0.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "这是一只狗",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Color.fromRGBO(0, 0, 0, 0.5),
                borderRadius: BorderRadius.only(
                    topLeft:Radius.zero,
                    topRight:Radius.zero,
                    bottomLeft:Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0))
              ),
            ),
          )
        ],
      ),
    );
  }
}

///设置页面的练习，真实模仿item行
class _settingSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey[200],
        child: Column(
          children: [
            Container(
              height: 80,
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Icon(Icons.wifi, color: Colors.blue),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("网络和互联网", style: TextStyle(fontSize: 16)),
                        Text(
                          "wlan连接和移动网络,wlan连接和移动网络,wlan连接和移动网络,wlan连接和移动网络",
                          style:
                              TextStyle(fontSize: 14, color: Colors.grey[800]),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.arrow_forward, color: Colors.blue)
                ],
              ),
            ),
            Container(
              color: Colors.white,
              height: 80,
              margin: const EdgeInsets.only(top:16),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("设置1"),
                  Checkbox(
                    value:false,
                    onChanged: (val){

                    },)

                ],
              ),
            )
          ],
        ));
  }
}

///全屏的壁纸效果，例如设置背景图
class _fullScreenSection extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage("https://ss3.bdstatic"
              ".com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=226419046,487093019&fm=26&gp=0.jpg"),
          fit: BoxFit.fill
        )
      ),
      child: Text("hello world"),
    );
  }
}

