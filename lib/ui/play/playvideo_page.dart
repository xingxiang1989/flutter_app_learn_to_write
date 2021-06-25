import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutterapplearntowrite/ui/base2/base_page.dart';
import 'package:flutterapplearntowrite/ui/base2/base_state.dart';
import 'package:flutterapplearntowrite/util/LogUtils.dart';
import 'package:flutterapplearntowrite/widget/myText.dart';
import 'package:video_player/video_player.dart';

///视频播放页面
class PlayVideoPage extends BasePage {
  @override
  State<StatefulWidget> cState() => PlayVideoPageState();
}

class PlayVideoPageState extends BaseState<PlayVideoPage> {

  String TAG = "PlayVideoPageState";
  VideoPlayerController _controller;
  bool _initOk = false;
  double screenWidth, screenHeight;

  @override
  void onCreate() {
    screenWidth = ScreenUtil.getInstance().screenWidth;
    screenHeight = ScreenUtil.getInstance().screenHeight;

    _controller = VideoPlayerController.network(
        'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4')
      ..addListener(() {
        LogUtils.d(TAG, "controller isInitialized = ${_controller.value.isInitialized} "
            ", _initOk = $_initOk");
        if (_controller.value.isInitialized && !_initOk) {
          LogUtils.d(TAG,"初始化成功，开始自动播放");
          _controller.play();
          setState(() {
            _initOk = true;
          });
        }
      })
      ..initialize().then((value) => setState(() {}));
  }

  @override
  void onDestroy() {
    _controller.dispose();
  }

  @override
  Widget pageBody(BuildContext context) {
    return MaterialApp(
      title: 'Video Demo',
      home: Scaffold(
        body: Stack(
          children: [
            Center(
              child: _controller.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    )
                  : Container(),
            ),
            Visibility(visible: _initOk ? false : true , child: loadingPage())
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _controller.value.isPlaying
                  ? _controller.pause()
                  : _controller.play();
            });
          },
        ),
      ),
    );
  }

  @override
  Widget appbar() {
    return null;
  }

  Widget loadingPage() {
    return Container(
        width: screenWidth,
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(
                height: 24,
              ),
              MyText("初始化...", color: Colors.black)
            ],
          ),
        ));
  }

}
