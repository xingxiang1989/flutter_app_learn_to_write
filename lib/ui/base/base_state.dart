import 'package:flutter/material.dart';
import 'package:flutterapplearntowrite/ui/base/vm_s_contract.dart';

import 'base_vm.dart';
import 'base_widget.dart';

abstract class BaseState<VM extends BaseVM, T extends StatefulWidget>
    extends State implements VMSContract {
  VM _vm;
  bool _showLoading = true;
  bool _loadingShowContent = false;

  bool get showLoading => _showLoading;

  bool get loadingShowContent => _loadingShowContent;

  VM get vm => _vm;

  VM createVM();

  @override
  getShowLoadingCallback() {
    return (isShow) {
      setState(() {
        _showLoading = isShow;
      });
    };
  }

  @override
  getLoadingShowContentCallback() {
    return (isShow) {
      setState(() {
        _loadingShowContent = isShow;
      });
    };
  }

  @override
  notifyStateChanged() {
    return () {
      setState(() {});
    };
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _vm?.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
    _vm = createVM()
      ..setupContract(this)
      ..init();
  }

  PreferredSizeWidget createAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight),
      child: SafeArea(
        child: Offstage(),
      ),
    );
  }

  Widget createContentWidget();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //防止因键盘弹出造成bottom overlowed by X pixels
      resizeToAvoidBottomInset: false,
      appBar: createAppBar(),
      body: BaseWidget(
        contentWidget: createContentWidget(),
        showLoading: _showLoading,
        loadingShowContent: _loadingShowContent,
      ),
    );
  }

  @override
  void dispose() {
    _vm.dispose();
    super.dispose();
  }
}
