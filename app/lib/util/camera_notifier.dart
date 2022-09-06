


import 'package:flutter/material.dart';

class CameraNotifier extends ChangeNotifier {
  String fruit = 'unknown';

  void changeFruit(String newFruit){
    fruit = newFruit;
    notifyListeners();
  }
}