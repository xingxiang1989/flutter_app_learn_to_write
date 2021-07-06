import 'package:flutter/foundation.dart';

class VideoModelState with ChangeNotifier {
  double speedIndex;
  bool isPlaying;
  bool isMute;

  VideoModelState(
      {this.isPlaying = false, this.speedIndex = 3, this.isMute = false});

  updateSpeed(double _speedIndex){
    speedIndex = _speedIndex;
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
