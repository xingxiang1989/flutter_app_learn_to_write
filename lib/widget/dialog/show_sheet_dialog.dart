import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutterapplearntowrite/color/YColors.dart';

///底部弹框
class ShowSheetDialog extends StatefulWidget {
  String title;
  List<String> items = [];
  Function onTap;

  ShowSheetDialog({this.title, this.items, this.onTap});

  @override
  _ShowSheetDialogState createState() => _ShowSheetDialogState();
}

class _ShowSheetDialogState extends State<ShowSheetDialog> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight:
          Radius.circular(10)),
        color: YColors.white
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          (widget.title != null && widget.title.length > 0
              ? Container(
                  child: Text(
                    widget.title,
                    style: TextStyle(fontSize: 18, color: YColors.black),
                  ),
                  alignment: Alignment.center,
                  height: ScreenUtil.getInstance().getHeight(60),
                  decoration: BoxDecoration(
                      border: BorderDirectional(
                          bottom: BorderSide(
                    color: YColors.black40,
                  ))),
                )
              : Container()),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: widget.items.map((title) {
              int index = widget.items.indexOf(title);
              return GestureDetector(
                onTap: (){
                  widget.onTap(index);
                  Navigator.pop(context);
                },
                child: _itemCreate(title),
              );
            }).toList(),
          ),
          SizedBox(
            height: ScreenUtil.getInstance().getHeight(20),
            child: Container(
              color: YColors.black40,
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: _itemCreate("取消"),
          )
        ],
      ),
    );
  }

  Widget _itemCreate(String title) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Text(
          title,
          style: TextStyle(fontSize: 16, color: Colors.black),
          textAlign: TextAlign.center,
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: YColors.black40, width: 1)),
      ),
    );
  }
}
