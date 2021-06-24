import 'package:flutter/material.dart';

abstract class BasePage extends StatefulWidget {

  final Key key;
  BasePage({this.key}):super(key:key);

  @override
  State<StatefulWidget> createState() => cState();

  State<StatefulWidget> cState();
}