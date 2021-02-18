import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterapplearntowrite/common/constants.dart';
import 'package:flutterapplearntowrite/http/http.dart';
import 'package:flutterapplearntowrite/model/user_model.dart';
import 'package:flutterapplearntowrite/routes/application.dart';
import 'package:flutterapplearntowrite/routes/routes.dart';
import 'package:flutterapplearntowrite/ui/base/base_vm.dart';
import 'package:flutterapplearntowrite/util/LogUtils.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutterapplearntowrite/routes/app_routes.dart';


class LoginVM extends BaseVM {
  String TAG = "LoginVM";
  String userName = "";
  String passWord = "";

  LoginVM(BuildContext context) : super(context);

  @override
  void init() {
    showLoading(false);
    loadingShowContent(true);
  }

  ///MethodChannel 不太理解，
  callLoginCode(AppLifecycleState state) async {
    print("loginPage callLoginCode state---> $state");

    if (state == AppLifecycleState.resumed) {
      final platform = const MethodChannel(METHOD_CHANNEL_NAME);
      final code = await platform.invokeMethod(CALL_LOGIN_CODE);
      print("loginPage callLoginCode code = $code---> ");

      if (code != null) {
        _getAccessTokenFromCode(code);
      }
    }
  }

  void _getAccessTokenFromCode(code) async {
    print("loginPage _getAccessTokenFromCode ---> ");

    showLoading(true);
    try {
      Dio dio = new Dio();
      dio.options.baseUrl = GITHUB_BASE_URL;
      dio.options.connectTimeout = 5000;
      dio.options.receiveTimeout = 3000;

      Response response = await dio.post('/login/oauth/access_token',
          data: FormData.fromMap({
            'client_id': CLIENT_ID,
            'client_secret': CLIENT_SECRET,
            'code': code,
            'redirect_uri': REDIRECT_URI
          }));
      print("response data = ${response.data.toString()}");
      final token = response.data.toString().split("=")[1].split("&")[0];
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(SP_ACCESS_TOKEN, token);
      await prefs.setString(SP_AUTHORIZATION, '');
      _getUser();
    } on DioError catch (e) {
      showLoading(false);
      Fluttertoast.showToast(
          msg: 'getAccessTokenFromCode DioError: ${e.message}');
    } on Exception catch (e) {
      showLoading(false);
      Fluttertoast.showToast(msg: "getAccessTokenFromCode IOError: $e");
    }
  }

  ///获取个人信息
  _getUser() async {
    showLoading(true);
    try {
      Response response = await dio.get('/user');
      UserModel userModel = UserModel.fromJson(response.data);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(SP_USER_NAME, userModel.login);
      Fluttertoast.showToast(msg: 'login success! hi ${userModel.name}');
      Application.router.navigateTo(context, Routes.home);

    } on DioError catch (e) {
      showLoading(false);
      // clearUserInfo();
      Fluttertoast.showToast(msg: 'getUser error: ${e.message}');
    }
  }

  authorization() async {
    FocusScope.of(context).requestFocus(FocusNode());
    LogUtils.d(TAG, "URL_AUTHORIZATION =" + URL_AUTHORIZATION);
    if (await canLaunch(URL_AUTHORIZATION)) {
      // 为设置forceSafariVC，IOS 默认会打开APP内部WebView
      // 而APP内部WebView不支持重定向跳转到APP
      await launch(URL_AUTHORIZATION, forceSafariVC: false);
    } else {
      throw 'Can not launch $URL_AUTHORIZATION)';
    }
  }
}
