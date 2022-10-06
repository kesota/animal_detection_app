

import 'package:app/data/general_data.dart';
import 'package:flutter/material.dart';

class AnimalNotifier extends ChangeNotifier{
  GeneralData data = GeneralData();

  // Make a change on a display flag
  // ToDo: This feature is still debug mode. So need a modification on not to reverse the flag
  void update(String animalKey){
    data.animalDetail[animalKey]![0] = !data.animalDetail[animalKey]![0];
    notifyListeners();
  }
}