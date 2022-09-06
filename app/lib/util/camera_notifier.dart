


import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraNotifier extends ChangeNotifier {
  String fruit = 'unknown';

  List<XFile> picturesList = [];

  void changeFruit(String newFruit){
    fruit = newFruit;
    notifyListeners();
  }
  void updatePictures(XFile newPic){
    picturesList.add(newPic);
    notifyListeners();
  }

}