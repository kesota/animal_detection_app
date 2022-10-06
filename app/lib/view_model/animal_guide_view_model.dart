


import 'package:app/data/general_data.dart';
import 'package:app/model/animal_guide_model.dart';

class AnimalGuideViewModel{
  final AnimalGuideModel model = AnimalGuideModel();
  final GeneralData data = GeneralData();

  List<List<String>> getAnimalNames(){
    return model.covertList(data.animalDetail.keys.toList());
  }

  List<String> getErrorMessage(String animalKey){
   List<String> _error = model.errorMessage(animalKey, data);
    return _error;
  }
}