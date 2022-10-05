

import 'package:app/data/general_data.dart';
import 'package:flutter/material.dart';

class AnimalNotifier extends ChangeNotifier{
  GeneralData data = GeneralData();

  void update(String animalKey){
    data.animalDetail[animalKey]![0] = !data.animalDetail[animalKey]![0];


    notifyListeners();
  }




}