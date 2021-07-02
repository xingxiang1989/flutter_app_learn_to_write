import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutterapplearntowrite/color/YColors.dart';

class ShowAlertDialog extends StatefulWidget {
  //内容布局区域
  TextAlign contentAlign;

  String title;

  String content;

  Function onTap;

  List<String> items;

  ShowAlertDialog(
      {this.contentAlign = TextAlign.center,
      this.title,
      @required this.content,
      @required this.items,
      this.onTap});

  @override
  _ShowAlertDialogState createState() => _ShowAlertDialogState();
}

class _ShowAlertDialogState extends State<ShowAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: YColors.bg1,
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Container(
            color: YColors.white,
            width: ScreenUtil.getInstance().getWidth(275),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Visibility(
                  visible: widget.title != null && widget.title.length > 0,
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: ScreenUtil.getInstance().getHeight(20)),
                    child: Text(
                      widget.title != null ? widget.title : "",
                      textAlign: widget.contentAlign,
                      style: TextStyle(fontSize: 18, color: YColors.black),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      top: ScreenUtil.getInstance().getHeight(10),
                      bottom: ScreenUtil.getInstance().getHeight(20),
                      left: ScreenUtil.getInstance().getHeight(20),
                      right: ScreenUtil.getInstance().getHeight(20)),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: YColors.black, width: 1))),
                  child: Text(
                    widget.content,
                    textAlign: widget.contentAlign,
                    style: TextStyle(fontSize: 16, color: YColors.black),
                  ),
                ),
                _createBtnWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _createBtnWidget() {
    return widget.items.length == 1 ? _singleBtnWidget() : _twoBtnWidget();
  }

  Widget _singleBtnWidget() {
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        height: ScreenUtil.getInstance().getHeight(50),
        child: Text(
          widget.items[0],
          style: TextStyle(color: YColors.black, fontSize: 18),
        ),
      ),
      onTap: () {
        widget.onTap(3);
        Navigator.pop(context);
      },
    );
  }

  Widget _twoBtnWidget() {
    return Container(
      height: ScreenUtil.getInstance().getHeight(50),
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: GestureDetector(
                child: Container(
                  alignment: Alignment.center,
                  height: ScreenUtil.getInstance().getHeight(50),
                  child: Text(
                    widget.items[0],
                    style: TextStyle(color: YColors.black, fontSize: 18),
                  ),
                ),
                onTap: () {
                  widget.onTap(0);
                  Navigator.pop(context);
                },
              )),
          VerticalDivider(
            width:1,
            color: YColors.black,
          ),
          Expanded(
              flex: 1,
              child: GestureDetector(
                child: Container(
                  alignment: Alignment.center,
                  height: ScreenUtil.getInstance().getHeight(50),
                  child: Text(
                    widget.items[1],
                    style: TextStyle(color: YColors.blue, fontSize: 18),
                  ),
                ),
                onTap: () {
                  widget.onTap(1);
                  Navigator.pop(context);
                },
              ))
        ],
      ),
    );
  }
}
