import 'package:flutter/material.dart';
import 'package:flutterapplearntowrite/color/YColors.dart';
import 'package:flutterapplearntowrite/model/notification_model.dart';

// ignore: must_be_immutable
class RepositoryItemView extends StatelessWidget {
  ///定义的消息对象
  Repository _item;
  GestureTapCallback tapCallback;

  ///这个写法是参考系统任何widget的写法，设置一个默认的参数，和一个可选参数
  ///（可选参数用大括号）
  RepositoryItemView(this._item,{this.tapCallback});

  @override
  Widget build(BuildContext context) {
    final _licenseLength = _item.license?.name?.length ?? 0;
    final _license = _item.license?.name
        ?.substring(0, _licenseLength > 15 ? 15 : _licenseLength) ??
        '';
    final _nameLength = _item.name.length;
    final _name = _item.name.substring(0, _nameLength > 20 ? 20 : _nameLength);

    ///这个是作为item的布局，首先是可以进行点击的，点击事件是放在item里的
    return GestureDetector(
      onTap: tapCallback?? _goToRepositoryDetail(context),
      child: Container(
        padding: EdgeInsets.only(left: 15.0, top: 15.0, right: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _name,
              style: TextStyle(
                color: Colors.blue,
                fontSize: 20.0,
                fontWeight: FontWeight.bold
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:10.0),
              child: Text(
                _item.description??"",
                maxLines:4,
                overflow:TextOverflow.ellipsis, // 显示不完，就在后面显示点点
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 17.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:10.0),
              child: Row(
                children: [
                  _buildBottomInfo(_item?.language ?? '', 'images/circle.png',
                      _item.language?.isNotEmpty ?? false),
                  _buildBottomInfo(_item.stargazersCount.toString(),
                      'images/start.png', _item.stargazersCount > 0),
                  _buildBottomInfo(_item.forksCount.toString(),
                      'images/git_repo_forked.png', _item.forksCount > 0),
                  _buildBottomInfo(_license, 'images/license.png',
                      _item.license?.name?.isNotEmpty ?? false),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  ///动态跳转页面
  _goToRepositoryDetail(BuildContext context) {
    return () {
    //   Navigator.push(context, MaterialPageRoute(builder: (_) {
    //     return WebViewPage();
    //   }, settings: RouteSettings(arguments: { WebViewPage.ARGS_TITLE: _item.name, WebViewPage.ARGS_URL: _item.htmlUrl })));
    };
  }

  Widget _buildBottomInfo(String content, String imagePath, bool visible) {
    return Visibility(
      visible: visible,
      child: Padding(
        padding: const EdgeInsets.only(right:5.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(imagePath,
            width: 12.0,
            height: 12.0,),
            Padding(
              padding: const EdgeInsets.only(left: 3.0),
              child: Text(
                content,
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.grey,
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
