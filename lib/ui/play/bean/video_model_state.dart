import 'package:flutter/foundation.dart';

class VideoModelState with ChangeNotifier {
  double speed;
  bool isPlaying;
  bool isMute;

  VideoModelState(
      {this.isPlaying = false, this.speed = 1, this.isMute = false});

  updateSpeed(double _speed){
    speed = _speed;
    notifyListeners();
  }

  updateMute(bool mute){
    isMute = mute;
    notifyListeners();
  }

  updatePlaying(bool _isPlaying){
    isPlaying = _isPlaying;
    notifyListeners();
  }
}
