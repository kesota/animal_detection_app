


import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraNotifier extends ChangeNotifier {
  // Sample Parameter
  String fruit = 'unknown';

  List<XFile> picturesList = [];

  // Sample Function
  void changeFruit(String newFruit){
    fruit = newFruit;
    notifyListeners();
  }

  void updatePictures(XFile newPic){
    picturesList.add(newPic);
    notifyListeners();
  }

}