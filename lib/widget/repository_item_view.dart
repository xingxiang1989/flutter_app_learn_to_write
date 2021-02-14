import 'package:flutter/material.dart';
import 'package:flutterapplearntowrite/model/notification_model.dart';

// ignore: must_be_immutable
class RepositoryItemView extends StatelessWidget {
  ///定义的消息对象
  Repository _item;
  GestureTapCallback tapCallback;

  ///这个写法是参考系统任何widget的写法，设置一个默认的参数，和一个可选参数
  ///（可选参数用大括号）
  RepositoryItemView(this._item,{this.tapCallback});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("title",style: TextStyle(color: Colors.blue,fontSize: 20),),
          Padding(
            padding: const EdgeInsets.only(left: 0,top: 10,right: 0,bottom: 10),
            child: Text("content",style: TextStyle(color: Colors.grey,fontSize: 16),),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
          )
        ],
      ),
    );
  }
}
