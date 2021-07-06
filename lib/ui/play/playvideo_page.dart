import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterapplearntowrite/color/YColors.dart';
import 'package:flutterapplearntowrite/ui/base2/base_page.dart';
import 'package:flutterapplearntowrite/ui/base2/base_state.dart';
import 'package:flutterapplearntowrite/ui/play/bean/video_model.dart';
import 'package:flutterapplearntowrite/ui/play/bean/video_model_state.dart';
import 'package:flutterapplearntowrite/ui/play/controller_model_widget.dart';
import 'package:flutterapplearntowrite/ui/play/video_player_slider.dart';
import 'package:flutterapplearntowrite/util/LogUtils.dart';
import 'package:flutterapplearntowrite/util/function_util.dart';
import 'package:flutterapplearntowrite/widget/dialog/show_alert_dialog.dart';
import 'package:flutterapplearntowrite/widget/dialog/show_sheet_dialog.dart';
import 'package:flutterapplearntowrite/widget/image_button.dart';
import 'package:flutterapplearntowrite/widget/myText.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:orientation/orientation.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

///视频播放页面
class PlayVideoPage extends BasePage {
  @override
  State<StatefulWidget> cState() => PlayVideoPageState();
}

class PlayVideoPageState extends BaseState<PlayVideoPage> {
  String TAG = "PlayVideoPageState";
  VideoPlayerController _controller;
  //是否初始化
  bool _initOk = false;
  //是否在播放
  bool _isPlaying = false;
  double screenWidth, screenHeight;
  double aspectRatio = 1.6;
  String urlMp4 = "https://sample-videos"
      ".com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4";

  VideoModel _videoModel;
  VideoModelState _videoModelState;

  List<double> speedArray = [16,8,4,1];


  bool get _isFullScreen => MediaQuery.of(context).orientation == Orientation
      .landscape;

  @override
  void onCreate() {
    LogUtils.d(TAG, "initState onCreate()");
    screenWidth = ScreenUtil.getInstance().screenWidth;
    screenHeight = ScreenUtil.getInstance().screenHeight;
    _videoModel = VideoModel();
    _videoModelState

    _controller = VideoPlayerController.asset("videos/video.mp4")
      ..addListener(_videoListener)
      ..initialize().then((value) => setState(() {}));
  }

  void _videoListener() async {
    LogUtils.d(
        TAG,
        "controller isInitialized = ${_controller.value.isInitialized} "
        ", _initOk = $_initOk, isBuffering = ${_controller.value.isBuffering}, isplaying = ${_controller.value.isPlaying}");
    if (_controller.value.isInitialized && !_initOk) {
      LogUtils.d(TAG, "初始化成功，开始自动播放");
      _controller.play();
      setState(() {
        _initOk = true;
      });
    } else if (_controller.value.isPlaying) {
      _videoModel.updateDuration(_controller.value.duration.inMilliseconds,
          _controller.value.position.inMilliseconds);
    }
  }

  @override
  void didUpdateWidget(PlayVideoPage oldWidget) {
    print("didUpdateWidget");
  }

  @override
  void onDestroy() {
    _controller.removeListener(_videoListener);
    _controller.dispose();
  }

  @override
  Widget pageBody(BuildContext context) {
    return MaterialApp(
      title: 'Video Demo',
      home: Scaffold(
        body: ControllerModelWidget(
          controller: _controller,
          child: ChangeNotifierProvider(
            create: (context) => _videoModel,
            child: Container(
              margin: EdgeInsets.only(
                  top: ScreenUtil.getInstance().statusBarHeight),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      AspectRatio(
                        aspectRatio: aspectRatio,
                        child:
                            _initOk ? VideoPlayer(_controller) : loadingPage(),
                      ),
                      Visibility(
                        child: operationView(),
                        visible: _initOk,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
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
        color: Colors.yellow,
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

  ///上层操作view
  Widget operationView() {
    LogUtils.d(TAG, "operationView  refresh _isFullScreen = ${_isFullScreen},"
        " screenHeight = $screenHeight, screenWidth = $screenWidth");
    return Container(
      color: YColors.blue40,
      height: _isFullScreen ? screenHeight :
      screenWidth / aspectRatio,
      child: AspectRatio(
        aspectRatio: aspectRatio,
        child: Visibility(
          visible: _controller.value.isPlaying,
          child: Column(
            children: [
              toolbarView(),
              Spacer(),
              bottomPlayOpView(),
              Consumer(builder:
                  (BuildContext context, VideoModel value, Widget child) {
                LogUtils.d(TAG, "operationView VideoPlayerSlider refresh");
                return VideoPlayerSlider();
              })
            ],
          ),
        ),
      ),
    );
  }

  Widget toolbarView() {
    return Container(
      color: YColors.black40,
      padding: EdgeInsets.only(
          left: ScreenUtil.getInstance().getAdapterSize(15),
          right: ScreenUtil.getInstance().getAdapterSize(15)),
      height: ScreenUtil.getInstance().getAdapterSize(50),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SimpleImageButton(
              normalImage: "images/icon_white_back.png",
              onPressed: clickBack,
              width: ScreenUtil.getInstance().getAdapterSize(24),
              height: ScreenUtil.getInstance().getAdapterSize(24)),
          Text(
            "C3WN",
            style: TextStyle(color: YColors.white, fontSize: 16),
          ),
          Spacer(),
          SimpleImageButton(
              normalImage: "images/videowindow_icon_share.png",
              onPressed: clickShare,
              width: ScreenUtil.getInstance().getAdapterSize(24),
              height: ScreenUtil.getInstance().getAdapterSize(24)),
        ],
      ),
    );
  }

  Widget bottomPlayOpView() {
    return Container(
      padding: EdgeInsets.only(
          left: ScreenUtil.getInstance().getAdapterSize(15),
          right: ScreenUtil.getInstance().getAdapterSize(15)),
      margin: EdgeInsets.only(bottom: ScreenUtil.getInstance().getAdapterSize(0)),
      height: ScreenUtil.getInstance().getAdapterSize(50),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SimpleImageButton(
              normalImage: "images/videowindow_icon_volume_onnull.png",
              onPressed: clickVoiceBtn,
              width: ScreenUtil.getInstance().getAdapterSize(24),
              height: ScreenUtil.getInstance().getAdapterSize(24)),
          Spacer(),
          SizedBox(
            width: ScreenUtil.getInstance().getAdapterSize(200),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SimpleImageButton(
                    normalImage: "images/videowindow_icon_backwardnull.png",
                    onPressed: clickPlayRollBack,
                    width: ScreenUtil.getInstance().getAdapterSize(24),
                    height: ScreenUtil.getInstance().getAdapterSize(24)),
                SimpleImageButton(
                    normalImage: "images/videowindow_icon_play.png",
                    onPressed: clickPlayBtn,
                    width: ScreenUtil.getInstance().getAdapterSize(50),
                    height: ScreenUtil.getInstance().getAdapterSize(50)),
                SimpleImageButton(
                    normalImage: "images/playback_icon_fastx1_nor.png",
                    onPressed: clickPlayFastSpeed,
                    width: ScreenUtil.getInstance().getAdapterSize(24),
                    height: ScreenUtil.getInstance().getAdapterSize(24)),
              ],
            ),
          ),
          Spacer(),
          SimpleImageButton(
              normalImage: "images/videowindow_icon_fullscreennull.png",
              onPressed: _toggleFullScreen,
              width: ScreenUtil.getInstance().getAdapterSize(24),
              height: ScreenUtil.getInstance().getAdapterSize(24)),
        ],
      ),
    );
  }

  ///点击back按钮
  clickBack() {
    setState(() {
      if(_isFullScreen){
        OrientationPlugin.forceOrientation(DeviceOrientation.portraitUp);
      }else{
        finish();
      }
    });
  }

  ///分享按钮
  clickShare() {
    FunctionUtil.popDialog(context, ShowAlertDialog(items: ["取消","确定"],
      content: "分享给你的好友，你会得到相应的奖励?",onTap: (index){
        Fluttertoast.showToast(msg: "index = $index");
      },));
  }

  clickVoiceBtn() {}

  _toggleFullScreen() {
    setState(() {
      if (_isFullScreen) { // 如果是全屏就切换竖屏
        OrientationPlugin.forceOrientation(DeviceOrientation.portraitUp);
      } else {
        OrientationPlugin.forceOrientation(DeviceOrientation.landscapeRight);
      }
    });
  }

  clickPlayBtn() {}

  clickPlayFastSpeed() {
    FunctionUtil.bottomSheetDialog(context, ShowSheetDialog(
      title: "title",
      items: ["16倍","8倍","4倍","正常播放"],
      onTap: (int index){
        if(_controller.value.playbackSpeed != speedArray[index]){
          _controller.setPlaybackSpeed(speedArray[index]);
        }
      },
    ));
  }

  clickPlayRollBack() {}
}
