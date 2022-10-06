
import 'package:app/data/general_data.dart';
import 'package:app/data/param.dart';
import 'package:app/util/logger_manager.dart';
import 'package:logger/logger.dart';

class AnimalGuideModel{

  // Convert an map-keys into a list which can be used to display
  List<List<String>> covertList(List<String> animalList){
    List<List<String>> displayList = [];
    List<String> _temp= [];

    for (int i = 0; i < animalList.length; i++){
      _temp.add(animalList[i]);
      if (i != 0 && _temp.length % 3 == 0){
        displayList.add(_temp);
        _temp = [];
      } else if (i == animalList.length - 1){
        displayList.add(_temp);
      }
    }
    return displayList;
  }

  // Get an error message for a dialog
  List<String> errorMessage(String animalKey, GeneralData data){
    List<String> _error = [];
    if (!data.animalDetail[animalKey]![0]){
      _error.add(DefaultText.errorNotFoundTitle);
      _error.add(DefaultText.errorNotFound);
    } else if (data.animalDetail[animalKey]!.length <= data.necessaryInfoLength){
      _error.add(DefaultText.errorTitle);
      _error.add(DefaultText.errorNecessaryInfoNotFound);
    }
    return _error.isEmpty
        ? [DefaultText.errorTitle, DefaultText.errorDeDefault] : _error;
  }

  // Check whether the animal is found
  bool displayCondition(String animalKey, GeneralData data){
    // If animal is found AND it has necessary info
    return data.animalDetail[animalKey]![0] == true &&
        data.animalDetail[animalKey]!.length >= data.necessaryInfoLength
        ?  true : false;
  }
}