import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutterapplearntowrite/routes/root_handlers.dart';
import 'package:flutterapplearntowrite/util/LogUtils.dart';

class Routes {
  static String root = "/";
  static String login = "/login";
  static String home = "/home";
  static String countPage = "/countPage";
  static String providerTestPage = "/providerTest";

  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(handlerFunc:
        (BuildContext context, Map<String, List<String>> parameters) {
      LogUtils.d("Routes", "ROUTE WAS NOT FOUND !!!");
      return;
    });

    debugPrint("configureRoutes ");
    router.define(root, handler: rootHandler);
    router.define(login, handler: loginHandler);
    router.define(home, handler: homeHandler);
    router.define(countPage, handler: countPageHandler);
    router.define(providerTestPage, handler: providerTestPageHandler);
  }
}
