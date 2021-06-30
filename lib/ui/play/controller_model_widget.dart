import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
///共享数据类
class ControllerModelWidget extends InheritedWidget {
  ControllerModelWidget({
    this.controller,
    this.child
  });

  final VideoPlayerController controller;
  final Widget child;

  ///定义一个便捷方法，方便子树中的widget获取共享数据
  static ControllerModelWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ControllerModelWidget>();
  }

  @override
  bool updateShouldNotify(ControllerModelWidget old) {
    return false;
  }
}
