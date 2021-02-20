import 'package:dio/dio.dart';
import 'package:flutterapplearntowrite/common/constants.dart';
import 'package:flutterapplearntowrite/util/LogUtils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppInterceptors extends InterceptorsWrapper {
  @override
  Future onRequest(RequestOptions options) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String authorization = prefs.getString(SP_AUTHORIZATION);
    String token = prefs.getString(SP_ACCESS_TOKEN);
    print('authorization: $authorization, token: $token');
    options.headers['Authorization'] =
        authorization != null && authorization.isNotEmpty
            ? 'Basic ' + authorization
            : 'token ' + token;
    print('onRequest: ${options.headers}');
    return options;
  }

  @override
  Future onResponse(Response response) {
    LogUtils.e("AppInterceptors", 'onResponse ${response.headers}');
    LogUtils.e("AppInterceptors", 'onResponse ${response.data}');
    return super.onResponse(response);
  }

  @override
  Future onError(DioError err) {
    LogUtils.e("AppInterceptors", 'Network request onError ${err.request
        .uri}, ${err.message}');
    return super.onError(err);
  }
}
