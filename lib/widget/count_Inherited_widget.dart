import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class CountInheritedWidget extends InheritedWidget {
  const CountInheritedWidget({@required this.count, Key key, Widget child})
      : super(key: key, child: child);
  final int count;

  /// 统一的获取CountInheritedWidget实例, 方便树中子widget的获取共享数据
  /// 必须在State中调用才会有效
  static CountInheritedWidget of(BuildContext context) {
    /// 调用共享数据的子widget将不会回调didChangeDependencies方法，即子widget将不会更新
    /// return context.getElementForInheritedWidgetOfExactType
    /// <CountInheritedWidget>().widget;
    return context.dependOnInheritedWidgetOfExactType<CountInheritedWidget>();
  }

  @override
  bool updateShouldNotify(CountInheritedWidget oldWidget) {
    return oldWidget.count != count;
  }
}
