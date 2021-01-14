import 'package:flutter/material.dart';
import 'package:flutterapplearntowrite/routes/app_routes.dart';
import 'package:flutterapplearntowrite/ui/login/login.dart';
import 'package:flutterapplearntowrite/ui/welcome/welcome.dart';

///自带的路由，进行初始化和配置，还要学习第三方框架
class GithubApp extends StatefulWidget {
  @override
  _GithubAppState createState() => _GithubAppState();
}

class _GithubAppState extends State<GithubApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Github App",
      initialRoute: welcomeRoute.routeName,
      routes: {
        welcomeRoute.routeName:(context)=> WelcomePage(),
        loginRoute.routeName:(BuildContext context)=> LoginPage()
      },
    );
  }
}
