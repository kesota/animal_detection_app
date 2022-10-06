


import 'package:app/data/general_data.dart';
import 'package:app/model/animal_guide_model.dart';

class AnimalGuideViewModel{
  final AnimalGuideModel model = AnimalGuideModel();
  final GeneralData data = GeneralData();

  List<List<String>> getAnimalNames(){
    return model.covertList(data.animalDetail.keys.toList());
  }
}