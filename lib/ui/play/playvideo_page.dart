import 'package:flutter/material.dart';
import 'package:flutterapplearntowrite/ui/base2/base_page.dart';
import 'package:flutterapplearntowrite/ui/base2/base_state.dart';
import 'package:video_player/video_player.dart';

///视频播放页面
class PlayVideoPage extends BasePage{
  @override
  State<StatefulWidget> cState() => PlayVideoPageState();
}

class PlayVideoPageState extends BaseState<PlayVideoPage>{
  
  VideoPlayerController _controller;
  
  @override
  void onCreate() {
    _controller = VideoPlayerController.network('https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4')
        ..initialize().then((value) => setState((){}));
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
        body: Center(
          child: _controller.value.isInitialized ?
           AspectRatio(aspectRatio: _controller.value.aspectRatio,child:
           VideoPlayer(_controller),): Container(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _controller.value.isPlaying? _controller.pause() : _controller
                  .play();
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

}