import 'package:flutter/material.dart';
import 'package:flutterapplearntowrite/widget/notification_item_view.dart';
import 'package:fluttertoast/fluttertoast.dart';

///一个ListView，用于学习各种页面的入口
class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  static const Datas = const ["provider", "aa", "bb"];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.separated(
          itemCount: Datas.length,
          // ignore: missing_return
          separatorBuilder:(BuildContext context, int index){
            return Divider(height: 1,color: Colors.black);
          },
          itemBuilder: (BuildContext context, int index) {
            return NotificationItemView(Datas[index], tapCallback: () {
              _goPage(context,  Datas[index]);
            });
          }),
    );
  }

  ///item 点击事件跳转
  _goPage(BuildContext context,String label){
    Fluttertoast.showToast(msg: label);
  }
}
