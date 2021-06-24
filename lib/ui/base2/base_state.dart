import 'package:flutter/material.dart';
import 'package:flutterapplearntowrite/routes/application.dart';
import 'base_page.dart';
abstract class BaseState<T extends BasePage> extends State<T> {

  String _appTitle = 'Title';
  List<Widget> _actions;
  Color bgColor = Color(0xFFF6F6F6);
  BuildContext mContext;

  @override
  void initState() {
    beforeInit();
    super.initState();
    print("initState");
    onCreate();
  }

  @override
  Widget build(BuildContext context) {
    mContext = context;
    print("build");
    return Scaffold(
      appBar: appbar(),
      body: pageBody(context),
      backgroundColor: bgColor,
      floatingActionButton: floBtn(),
    );
  }

  @override
  void dispose() {
    beforeDispose();
    super.dispose();
    print("dispose");

    onDestroy();
  }


  @override
  void didUpdateWidget(T oldWidget) {
    print("didUpdateWidget");

  }

  //页面初始化
  void onCreate();
  //页面布局
  Widget pageBody(BuildContext context);
  //页面销毁
  void onDestroy();

  //初始化之前的操作
  void beforeInit() {
  }
  //销毁之前的操作
  void beforeDispose() {

  }

  /*
    销毁页面
   */
  void finish(){
    Application.router.pop(mContext);
  }
  /*
   *  公用的AppBar的title
   */
  void setAppTitle(String title, {List<Widget> actions}){
    _appTitle = title;
    _actions = actions;
  }

  /*
   *  公用的AppBar
   */
  Widget appbar(){
    return AppBar(
      title: Text(_appTitle, style: TextStyle(color: Colors.white, fontSize: 16),),
      centerTitle: true,
      leading: GestureDetector(
        behavior: HitTestBehavior.opaque,
        child: Icon(Icons.arrow_back, color: Colors.white,),
        onTap: (){
          finish();
        },
      ),
      actions: _actions,
    );
  }

  /*
  * 悬浮按钮
   */
  Widget floBtn(){
    return null;
  }

  @override
  void deactivate() {
    print("deactivate");

  }

  @override
  void didChangeDependencies() {
    print("didChangeDependencies");
  }
}