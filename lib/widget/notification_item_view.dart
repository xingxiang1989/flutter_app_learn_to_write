import 'package:flutter/material.dart';

class NotificationItemView extends StatelessWidget{

  String _label;
  GestureTapCallback tapCallback;

  NotificationItemView(this._label,{this.tapCallback});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(bottom: 20),
    child: Text(_label),);
  }
}