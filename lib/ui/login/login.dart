import 'package:flutter/material.dart';
import 'package:flutterapplearntowrite/ui/base/base_page.dart';
import 'package:flutterapplearntowrite/ui/base/base_state.dart';
import 'package:flutterapplearntowrite/ui/login/login_vm.dart';

class LoginPage extends BasePage<_LoginPageState> {

  @override
  _LoginPageState createBaseState() => _LoginPageState();
}

class _LoginPageState extends BaseState<LoginVM, LoginPage> with WidgetsBindingObserver{

  final _userNameController = TextEditingController();
  final _passWordController = TextEditingController();

  AppLifecycleState _lastLifecycleState;

  @override
  void initState() {
    super.initState();
    print("loginPage initState ----->");
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print("loginPage didChangeAppLifecycleState state = $state ----->");
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset("images/app_welcome.png", width: 100, height: 100,),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text("Sign in GitHub",
            style: TextStyle(fontSize: 30, color: Colors.black),),
        ),
        TextField(
          decoration: InputDecoration(
            hintText: "input username or email",
            hintStyle: TextStyle(fontSize: 14, color: Colors.grey,),
            hintMaxLines: 1,
            labelText: "input username or email",
            labelStyle: TextStyle(fontSize: 10, color: Colors.blue,),
          ),
          controller: _userNameController,
          onChanged: (String content) =>
              setState(() {
                print("username = $content");
                vm.userName = content;
              }),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: "input passWord",
              hintStyle: TextStyle(fontSize: 14, color: Colors.grey,),
              hintMaxLines: 1,
              labelText: "input passWord",
              labelStyle: TextStyle(fontSize: 10, color: Colors.blue,),
            ),
            controller: _passWordController,
            onChanged: (String content) =>
                setState(() {
                  print("username = $content");
                  vm.userName = content;
                }),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: MaterialButton(
            onPressed: (){
              print("sign in");
            },
            minWidth: 280.0,
            height: 40,
            textColor: Colors.white,
            child: Text("sign in"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: MaterialButton(
            onPressed: (){
              print("authrize");
            },
            minWidth: 280.0,
            height: 40,
            textColor: Colors.white,
            child: Text("authrize"),
          ),
        )
      ],
    );
  }
}
