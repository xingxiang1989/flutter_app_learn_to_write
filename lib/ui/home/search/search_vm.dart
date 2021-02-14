import 'package:dio/dio.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutterapplearntowrite/model/search_model.dart';
import 'package:flutterapplearntowrite/ui/base/base_vm.dart';
import 'package:flutterapplearntowrite/http/http.dart';
import 'package:flutterapplearntowrite/util/LogUtils.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SearchVM extends BaseVM{

  ///
  SearchModel _searchModel;

  SearchModel get searchModel => _searchModel;

  SearchVM(BuildContext context) : super(context);


  @override
  void init() {
    loadingShowContent(true);
    Fluttertoast.showToast(
        msg: 'search start ');
    search('android-api-analysis');
  }

  search(String query) async{
    showLoading(true);
    try{
      Response response =
      await dio.get('/search/repositories', queryParameters: {'q': query});
      _searchModel = SearchModel.fromJson(response.data);
      Fluttertoast.showToast(
          msg: 'totalCount = ' +  _searchModel.totalCount.toString());
      LogUtils.d("SearchVM", "totalCount = " + _searchModel.totalCount.toString());
    }on DioError catch (e) {
      _searchModel = null;
      Fluttertoast.showToast(
          msg: 'getAccessTokenFromCode DioError: ${e.message}');
    }

    showLoading(false);

  }
}