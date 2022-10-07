

import 'package:app/data/animal_notifier.dart';
import 'package:app/data/param.dart';
import 'package:app/util/logger_manager.dart';
import 'package:app/view/animal_detail.dart';
import 'package:app/view_model/animal_guide_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnimalGuide extends StatefulWidget{
  const AnimalGuide({Key? key}) : super(key:key);
  @override
  State<AnimalGuide> createState() => _AnimalGuide();
}

class _AnimalGuide extends State<AnimalGuide>{
  final AnimalGuideViewModel model = AnimalGuideViewModel();
  final LoggerManager logger = LoggerManager();
  List<List<String>> animalList = [];

  @override
  void initState(){
    super.initState();
    animalList = model.getAnimalNames();
    logger.d(animalList);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AnimalNotifier>(
      builder:(context, notifier, child){
        return Scaffold(
            appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0,),
            body: SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      // ToDo: Replace with the actual searching function
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.012),),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.83,
                            height: 50,
                            color: Colors.grey,
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            color: Colors.black,
                          )
                        ],),
                      const Padding(padding: Margin.animalBetween2),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.95,
                          height: MediaQuery.of(context).size.height * 0.75,
                          color: Colors.lightBlue[100],
                          child: Column(
                            children: [
                              const Padding(padding: Margin.animalBetween),
                              Container(
                                  width: MediaQuery.of(context).size.width * 0.95,
                                  height: MediaQuery.of(context).size.height * 0.74,
                                  color: Colors.lightBlue[100],
                                  child:
                                  ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: animalList.length,
                                      itemBuilder: (BuildContext context, int index) {
                                        return animalRowing(animalList[index], notifier);
                                      }
                                  )
                              )
                            ],
                          )
                      )
                    ],
                  ),
                ),
              ),
        );
    }
    );
  }

  Widget animalRowing(List<String> animalNames, AnimalNotifier _model){
    return SizedBox(
      height: WidgetParm.animalBoxHeight,
      child:  ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: animalNames.length,
          itemBuilder: (BuildContext context, int index){
            return SizedBox(
              width: WidgetParm.animalBoxWidth,
              height: WidgetParm.animalBoxHeight,
              child: Center(
                child: eachAnimal(animalNames[index], _model ),
              ),
            );
          }
      ),
    );
  }

  Widget eachAnimal(String animalName, AnimalNotifier _model){
    // ToDo: Replace 1st Icon with Photos
    final Icon icon = model.data.animalDetail[animalName]![0]
        ?  const Icon(Icons.check) : const Icon(Icons.question_mark);

    return Column(
      children: [
        const Padding(padding: Margin.animalBetween),
        Container(
          width: WidgetParm.animalPicWidth,
          height: WidgetParm.animalPicHeight,
          decoration: BoxDecoration(border: Border.all(color: Colors.red),),
          child: Center(
            child: IconButton(
                icon: icon,
                onPressed: (){
                  logger.d(animalName);
                  if (model.checkDisplayCondition(animalName)
                  ){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            AnimalDetailView(
                                name: animalName,
                                type: model.data.animalDetail[animalName]![1],
                                detail1: model.data.animalDetail[animalName]![2],
                                detail2: model.data.animalDetail[animalName]![3]
                            )));
                  } else{
                    _dialog(model.getErrorMessage(animalName));
                  }
                }),
          ),
        ),
        const Padding(padding: Margin.animalBetween),
        Container(
          width: WidgetParm.animalTextWidth,
          height: WidgetParm.animalTextHeight,
          padding: Margin.animalTextMargin,
          decoration: BoxDecoration(border: Border.all(color: Colors.red),),
          child:  Center(
            // ToDo: Make sure FittedBox works, maybe we can get rid of button function
              child: TextButton(
                child: FittedBox(
                  child: Text(animalName),
                ),
                onPressed: (){
                  // debug: just to see whether the notifier works
                  _model.update(animalName);
                  },
              )
          ),
        ),
      ],
    );
  }

  Future<String?> _dialog(List<String> _message){
    return showDialog<String>(
      barrierColor: Colors.lightBlueAccent[100]!.withOpacity(0.5),
      context: context,
      builder: (BuildContext context) => AlertDialog(
        // ToDo: Once the design is fixed, change widgets below
      title:
          Container(
            alignment: Alignment.topLeft,
            child: Text(_message[0]),
            decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1.5, color: Colors.black))),
          ),
        content: Text(_message[1]),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, '戻る'),
            child: const Text('戻る'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  Widget _dialog2(){
    return Dialog(
      child: Container(
        child: Text('text'),
      ),
    );
  }
}