
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
}