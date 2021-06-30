import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutterapplearntowrite/ui/play/controller_model_widget.dart';
import 'package:flutterapplearntowrite/util/LogUtils.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerSlider extends StatefulWidget {
  @override
  State<StatefulWidget> cState() {
    return VideoPlayerSliderState();
  }

  @override
  State<StatefulWidget> createState() {
    return VideoPlayerSliderState();
  }


}

class VideoPlayerSliderState extends State<VideoPlayerSlider> {
  String TAG = "VideoPlayerSliderState";
  double progressValue;
  String labelProgress;

  VideoPlayerController get controller =>
      ControllerModelWidget.of(context).controller;


  @override
  void initState() {
    super.initState();
    progressValue = 0;
    labelProgress = "00:00";
  }

  @override
  void didUpdateWidget(VideoPlayerSlider oldWidget) {
    super.didUpdateWidget(oldWidget);
    LogUtils.d(TAG, "didUpdateWidget--->");
    int position = controller.value.position.inMilliseconds;
    int duration = controller.value.duration.inMilliseconds;
    if(position>=duration){
      position=duration;
    }
    setState(() {
      progressValue = position / duration * 100;
      labelProgress = DateUtil.formatDateMs(
        progressValue.toInt(),
        format: 'mm:ss',
      );
    });
  }

  ///刚开始点击
  void _onChangedStart(double value) {
    LogUtils.d(TAG, "_onChangedStart $value");
  }

  ///滑动或者点击结束，已松手
  void _onChangedEnd(double value) {
    LogUtils.d(TAG, "_onChangedEnd $value");

    int duration = controller.value.duration.inMilliseconds;
    controller.seekTo(Duration(milliseconds: (value / 100 * duration).toInt()));
  }

  ///正在滑动或者点击，未松手
  void _onChangedListener(double value) {

    int duration = controller.value.duration.inMilliseconds;
    LogUtils.d(TAG, "_onChangedListener duration = $duration , value = $value");

    setState(() {
      progressValue = value;
      labelProgress = DateUtil.formatDateMs(
        (value / 100 * duration).toInt(),
        format: 'mm:ss',
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      //自定义风格
        data: SliderTheme.of(context).copyWith(
          //进度条滑块左边颜色
          inactiveTrackColor: Colors.white,
          overlayShape: RoundSliderOverlayShape(
            //可继承SliderComponentShape自定义形状
            overlayRadius: 10, //滑块外圈大小
          ),
          thumbShape: RoundSliderThumbShape(
            //可继承SliderComponentShape自定义形状
            disabledThumbRadius: 7, //禁用是滑块大小
            enabledThumbRadius: 7, //滑块大小
          ),
        ),
        child: Slider(
          value: progressValue,
          onChangeStart: _onChangedStart,
          onChanged: _onChangedListener,
          onChangeEnd: _onChangedEnd,
          label: labelProgress,
          divisions: 100,
          min: 0,
          max: 100,
        ));
  }
}
