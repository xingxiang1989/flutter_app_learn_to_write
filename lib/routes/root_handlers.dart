import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutterapplearntowrite/ui/count/count.dart';
import 'package:flutterapplearntowrite/ui/home/home.dart';
import 'package:flutterapplearntowrite/ui/login/login.dart';
import 'package:flutterapplearntowrite/ui/welcome/welcome.dart';

var rootHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return WelcomePage();
});

var loginHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return LoginPage();
});

var homeHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return HomePage();
});

var countPageHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return CountPage();
});
