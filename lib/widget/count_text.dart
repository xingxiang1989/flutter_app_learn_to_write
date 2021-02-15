import 'package:flutter/material.dart';
import 'package:flutterapplearntowrite/util/LogUtils.dart';
import 'package:flutterapplearntowrite/widget/count_Inherited_widget.dart';

class CountText extends StatefulWidget {
  @override
  _CountTextState createState() => _CountTextState();
}

class _CountTextState extends State<CountText> {
  @override
  Widget build(BuildContext context) {
    return Text("count = ${CountInheritedWidget.of(context).count.toString()}");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    LogUtils.d("CountText", "didChangeDependencies");
  }
}
