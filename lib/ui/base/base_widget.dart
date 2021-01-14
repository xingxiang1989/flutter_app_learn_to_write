import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///构造一个基础类，自带loading
class BaseWidget extends StatelessWidget {
  final bool showLoading;
  final Widget contentWidget;
  final bool loadingShowContent;

  ///模仿系统类写
  BaseWidget(
      {Key key,
      @required this.contentWidget,
      this.showLoading = true,
      this.loadingShowContent = false})
      : super(key: key);

  ///Stack 类似于FrameLayout，做了两层，最下面是content layout，上面是loading布局
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Visibility(
          visible: !showLoading || loadingShowContent,
          child: contentWidget,
        ),
        Visibility(
          visible: showLoading,
          child: Center(
            child: Image.asset('images/loading.gif'),
          ),
        ),
      ],
    );
  }
}
