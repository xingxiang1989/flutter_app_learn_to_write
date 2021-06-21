import 'package:flutter/material.dart';

class NotificationItemView extends StatelessWidget {
  String _label;
  GestureTapCallback tapCallback;

  NotificationItemView(this._label, {this.tapCallback});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tapCallback,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Text(_label),
      ),
    );
  }
}
