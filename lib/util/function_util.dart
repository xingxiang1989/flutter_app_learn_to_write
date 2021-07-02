import 'package:flutter/material.dart';
import 'package:flutterapplearntowrite/widget/dialog/show_sheet_dialog.dart';

class FunctionUtil {
  static void bottomSheetDialog(BuildContext context, Widget widget) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return widget;
        },
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))));
  }
}
