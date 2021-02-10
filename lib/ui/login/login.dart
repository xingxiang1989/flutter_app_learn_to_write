import 'package:flutter/material.dart';
import 'package:flutterapplearntowrite/color/YColors.dart';
import 'package:flutterapplearntowrite/ui/base/base_page.dart';
import 'package:flutterapplearntowrite/ui/base/base_state.dart';
import 'package:flutterapplearntowrite/ui/login/login_vm.dart';
import 'package:flutterapplearntowrite/util/LogUtils.dart';

/**
 * https://www.jianshu.com/p/f06cc6c74d20
 * btn 相关的
 */
class LoginPage extends BasePage<_LoginPageState> {
  @override
  _LoginPageState createBaseState() => _LoginPageState();
}

class _LoginPageState extends BaseState<LoginVM, LoginPage>
    with WidgetsBindingObserver {
  static const String TAG = "_LoginPageState";
  final _passwordFocusNode = FocusNode();
  final _userNameController = TextEditingController();
  final _passWordController = TextEditingController();

  AppLifecycleState _lastLifecycleState;

  @override
  void initState() {
    super.initState();
    LogUtils.d(TAG, "initState ----->");
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    LogUtils.d(TAG, "loginPage didChangeAppLifecycleState state = $state ----->");
    setState(() {
      _lastLifecycleState = state;
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  LoginVM createVM() => LoginVM(context);

  @override
  Widget createContentWidget() {
    vm.callLoginCode(_lastLifecycleState);
    return Container(
      color: Colors.cyanAccent,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Image.asset(
              "images/app_welcome.png",
              width: 200,
              height: 200,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Text(
              "Sign in GitHub",
              style: TextStyle(fontSize: 30, color: Colors.black),
            ),
          ),
          Container(
            margin:
                EdgeInsets.only(left: 0.0, top: 20.0, right: 0.0, bottom: 0.0),
            child: SizedBox(
              width: 291,
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                    hintText: "input username or email",
                    hintStyle: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[800],
                    ),
                    hintMaxLines: 1,
                    border: OutlineInputBorder(
                      ///设置边框四个角的弧度
                      borderRadius: BorderRadius.all(Radius.circular(24)),

                      ///用来配置边框的样式
                      borderSide: BorderSide(
                        ///设置边框的颜色
                        color: Colors.white,
                        ///设置边框的粗细
                        width: 1.0,
                      ),
                    ),
                    filled: true,
                    fillColor: YColors.white40
                ),
                controller: _userNameController,
                textInputAction: TextInputAction.next,
                onChanged: (String content) => setState(() {
                  LogUtils.d(TAG, "onChanged username = $content");
                  vm.userName = content;
                }),
                onEditingComplete: () {
                  return FocusScope.of(context).requestFocus(_passwordFocusNode);
                },
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 0.0, top: 20.0, right: 0.0, bottom: 0.0),
            child: SizedBox(
              width: 291,
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                  hintText: "input passWord",
                  hintStyle: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[800],
                  ),
                  hintMaxLines: 1,
                    border: OutlineInputBorder(
                      ///设置边框四个角的弧度
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                      ///用来配置边框的样式
                      borderSide: BorderSide(
                        ///设置边框的颜色
                        color: YColors.white,

                        ///设置边框的粗细
                        width: 1.0,
                      ),
                    ),
                    filled: true,
                    fillColor: YColors.white40,
                ),
                controller: _passWordController,
                onChanged: (String content) => setState(() {
                  LogUtils.d(TAG, "password = $content");
                  vm.passWord = content;
                }),
                textInputAction: TextInputAction.next,
                focusNode: _passwordFocusNode,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: SizedBox(
              width: 291,
              height: 50,
              child: FlatButton(
                color: Colors.blue,
                highlightColor: Colors.blue[700],
                colorBrightness: Brightness.dark,
                splashColor: Colors.grey,
                onPressed: () {
                  LogUtils.d(TAG, "onPressed sign in");
                },
                shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                child: Text(
                  "sign in",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: SizedBox(
              width: 291,
              height: 50,
              child: FlatButton(
                color: Colors.blue,
                highlightColor: Colors.blue[700],
                colorBrightness: Brightness.dark,
                splashColor: Colors.grey,
                onPressed: () {
                  LogUtils.d(TAG, "onPressed authrize");
                  vm.authorization();
                },
                shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                child: Text(
                  "authrize",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
