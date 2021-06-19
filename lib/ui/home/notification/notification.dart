import 'package:flutter/material.dart';
import 'package:flutterapplearntowrite/widget/notification_item_view.dart';

///一个ListView，用于学习各种页面的入口
class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {

  static const Datas = const ["provider"];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(itemBuilder: (BuildContext context, int index){
        return NotificationItemView(Datas[index],tapCallback: (){

        });
      }),
    );
  }
}
