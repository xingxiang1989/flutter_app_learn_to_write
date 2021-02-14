import 'package:flutter/material.dart';
import 'package:flutterapplearntowrite/model/search_model.dart';
import 'package:flutterapplearntowrite/ui/base/base_page.dart';
import 'package:flutterapplearntowrite/ui/base/base_state.dart';
import 'package:flutterapplearntowrite/ui/home/search/search_vm.dart';
import 'package:flutterapplearntowrite/widget/repository_item_view.dart';

class SearchTabPage extends BasePage {
  @override
  _SearchTabPageState createBaseState() => _SearchTabPageState();
}

///这种定义很常见，参看ListView中的定义IndexedWidgetBuilder
///typedef IndexedWidgetBuilder = Widget Function(BuildContext context, int index);
///首先定义一个对象，传入一个SearchModel对象，返回一个widget。
typedef SearchListWidget = Widget Function(SearchModel model);

class _SearchTabPageState extends BaseState<SearchVM, SearchTabPage> {
  @override
  SearchVM createVM() => SearchVM(context);

  SearchListWidget _getListWidget;
  ValueNotifier<SearchModel> _SearchModelNotifier;

  @override
  void initState() {
    super.initState();
    _getListWidget = (SearchModel model) {
      return ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return RepositoryItemView(model?.items[index]);
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              height: 1,
              color: Colors.grey,
            );
          },
          itemCount: model?.items?.length ?? 0);
    };

    _SearchModelNotifier = ValueNotifier<SearchModel>(vm?.searchModel);
  }

  Widget buildValueListenableBuilder() {
    return ValueListenableBuilder(
      ///数据发生变化时回调
      builder: (context, value, child) {
        return value == null
            ? Center(
                child: Image.asset('images/loading.gif'),
              )
            : _getListWidget(value);
      },

      ///监听的数据
      valueListenable: _SearchModelNotifier,
    );
  }

  @override
  Widget createContentWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
            width: double.infinity,
            height: 100,
            child: Container(
              color: Colors.blue,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                    child: Icon(Icons.search),
                  )
                ],
              ),
            )),
        Expanded(
          child: Scrollbar(
            child: _getListWidget(vm.searchModel),
          ),
        )
      ],
    );
  }
}
