import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutterapplearntowrite/routes/app_routes.dart';
import 'package:flutterapplearntowrite/routes/application.dart';
import 'package:flutterapplearntowrite/routes/routes.dart';
import 'package:flutterapplearntowrite/ui/count/count.dart';
import 'package:flutterapplearntowrite/ui/home/home.dart';
import 'package:flutterapplearntowrite/ui/login/login.dart';
import 'package:flutterapplearntowrite/ui/welcome/welcome.dart';
import 'package:flutterapplearntowrite/ui/home/home.dart';

///自带的路由，进行初始化和配置，还要学习第三方框架
class GithubApp extends StatefulWidget {
  @override
  _GithubAppState createState() => _GithubAppState();
}

class _GithubAppState extends State<GithubApp> {

  _GithubAppState(){
    final router = FluroRouter();
    Routes.configureRoutes(router);
    Application.router = router;
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Github App",
      onGenerateRoute: Application.router.generator,

      // initialRoute: welcomeRoute.routeName,
      // routes: {
      //   welcomeRoute.routeName: (context) => WelcomePage(),
      //   loginRoute.routeName: (BuildContext context) => LoginPage(),
      //   homeRoute.routeName: (BuildContext context) => HomePage(),
      //   countPageRoute.routeName:(BuildContext context) => CountPage(),
      // },
    );
  }
}
