import 'package:flutter/material.dart';

class VideoModel with ChangeNotifier{
  int totalDuration;
  int currentDuration;

  VideoModel({this.totalDuration,this.currentDuration = 0});


  updateDuration(int totalDuration, int duration){
    this.totalDuration = totalDuration;
    currentDuration = duration;
    debugPrint("updateDuration totalDuration = ${this.totalDuration} "
        "currentDuration = "
        "$currentDuration");
    notifyListeners();
  }

}
