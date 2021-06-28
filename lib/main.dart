import 'package:flustars/flustars.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutterapplearntowrite/ui/app.dart';

void main() {

  // debugPrint("dddd");
  // debugPrint = (String message, {int wrapWidth}) => debugPrintSynchronously(message, wrapWidth: wrapWidth);
  // debugPrintMarkNeedsLayoutStacks = true;
  // debugPrintMarkNeedsPaintStacks = true;
  setDesignWHD(375, 812);
  runApp(GithubApp());
}

