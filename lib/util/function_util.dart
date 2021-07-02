import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutterapplearntowrite/widget/dialog/show_sheet_dialog.dart';

class FunctionUtil {
  static void bottomSheetDialog(BuildContext context, Widget widget) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return widget;
      },
    );
  }

  static void popDialog(BuildContext context, Widget widget) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return widget;
        });
  }
}
