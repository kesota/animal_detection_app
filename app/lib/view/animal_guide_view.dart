

import 'package:app/util/logger_manager.dart';
import 'package:app/view/animal_detail.dart';
import 'package:app/view_model/animal_guide_view_model.dart';
import 'package:flutter/material.dart';

class AnimalGuide extends StatefulWidget{
  const AnimalGuide({Key? key}) : super(key:key);
  State<AnimalGuide> createState() => _AnimalGuide();
}

class _AnimalGuide extends State<AnimalGuide>{
  final AnimalGuideViewModel model = AnimalGuideViewModel();
  final LoggerManager logger = LoggerManager();
  List<List<String>> animalList = [];

  @override
  void initState(){
    logger.wtf(model.data.animalDetail.keys);
    super.initState();
    animalList = model.getAnimalNames();
    logger.wtf(animalList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0,),
      body: Center(
        child: Column(
          children: [
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
            Padding(padding: EdgeInsets.all(5)),
            Container(
                width: MediaQuery.of(context).size.width * 0.95,
                height: MediaQuery.of(context).size.height * 0.75,
                color: Colors.lightBlue[100],
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.all(2)),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.95,
                        height: MediaQuery.of(context).size.height * 0.74,
                        color: Colors.lightBlue[100],
                        child:
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: animalList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return animalRowing(animalList[index]);
                            }
                            )
                    )
                  ],
                )
            )
          ],
        ),
      )
    );
  }

  Widget animalRowing(List<String> animalNames){
    return SizedBox(
      height: 125,
      child:  ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: animalNames.length,
          itemBuilder: (BuildContext context, int index){
            return Container(
              width: 125,
              height: 125,
              child: Center(
                child: eachAnimal(animalNames[index]),
              ),
            );
          }
      ),
    );
  }

  Widget eachAnimal(String animalName){
    // ToDo: Replace 2nd Icon with Photos
    final Icon icon = model.data.animalDetail[animalName]![0]
        ?  Icon(Icons.check) : const Icon(Icons.question_mark);

    return Column(
      children: [
        Padding(padding: EdgeInsets.all(2)),
        Container(
          width: 110,
          height: 90,
          decoration: BoxDecoration(border: Border.all(color: Colors.red),),
          child: Center(
            child: IconButton(
                icon: icon,
                onPressed: (){
                  logger.d(animalName);
                  if (model.data.animalDetail[animalName]![0] == true &&
                      model.data.animalDetail[animalName]!.length >= 4
                  ){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            AnimalDetailView(
                                name: animalName,
                                type: model.data.animalDetail[animalName]![1],
                                detail1: model.data.animalDetail[animalName]![2],
                                detail2: model.data.animalDetail[animalName]![3]
                            )));
                  }
                }
                ),
          ),
        ),
        Padding(padding: EdgeInsets.all(2)),
        Container(
          width: 90,
          height: 23,
          padding: EdgeInsets.only(left:2.5, right: 2.5),
          decoration: BoxDecoration(border: Border.all(color: Colors.red),),
          child: Center(
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(animalName),
            ),
          ),
        ),
      ],
    );
  }
}