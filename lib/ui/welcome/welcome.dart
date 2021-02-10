import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutterapplearntowrite/common/constants.dart';
import 'package:flutterapplearntowrite/routes/app_routes.dart';
import 'package:flutterapplearntowrite/util/LogUtils.dart';
import 'package:shared_preferences/shared_preferences.dart';

///启动欢迎页面，里面有很多知识点
///Timer
///SharedPreferences
///async await
///WillPopScope ，PreferredSize
class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  String TAG = "_WelcomePageState";
  Timer _timer;

  void _goToLogin() async {
    LogUtils.d(TAG, "_goToLogin ---> ");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String authorization = prefs.getString(SP_AUTHORIZATION);
    String token = prefs.getString(SP_ACCESS_TOKEN);
    LogUtils.d(TAG, "_goToLogin authorization = " + authorization);
    LogUtils.d(TAG, "_goToLogin token = " + token);

    if ((authorization != null && authorization.isNotEmpty) ||
        (token != null && token.isNotEmpty)) {
      LogUtils.d(TAG, "_goToLogin homeRoute");
      Navigator.pushReplacementNamed(context, homeRoute.routeName);
    } else {
      LogUtils.d(TAG, "_goToLogin loginRoute");
      Navigator.pushReplacementNamed(context, loginRoute.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    return WillPopScope(
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: SafeArea(
              top: true,
              child: Offstage(),
            ),
          ),
          body: Container(
              width: width,
              height: height,
              child: GestureDetector(
                child: Image.asset('images/app_welcome.png'),
              ))),
      onWillPop: () {
        return Future.value(false);
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(milliseconds: 1500), () {
      _goToLogin();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _timer = null;
    super.dispose();
  }
}
