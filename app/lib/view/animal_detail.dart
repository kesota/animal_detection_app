

import 'package:app/data/param.dart';
import 'package:flutter/material.dart';

class AnimalDetailView extends StatelessWidget{
  const AnimalDetailView({Key? key, required this.name, required this.type,
    required this.detail1, required this.detail2}) : super(key:key);

  final String name;
  final String type;
  final String detail1;
  final String detail2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.transparent,
        backgroundColor: Colors.white12,
        elevation: 0,
      ),
      body: Column(
          children:[
            const Padding(padding: Margin.animalPagePadding1),
            animalTitle(name, FontStyle.name, Margin.leftPadding),
            animalTitle(type, FontStyle.type, Margin.leftPadding),
            const Padding(padding: Margin.afterTitle),
            // ToDo: replace this container to selected photos
            Container(
              child: Icon(Icons.animation, size: 100),
            ),
            const Padding(padding: Margin.afterTitle),
            animalTitle(DefaultText.mainHabitat, FontStyle.subtitle, Margin.leftPadding),
            const Padding(padding: Margin.betweenTextTitle),
            detailInfo(detail1, FontStyle.detail, Margin.leftPadding),
            const Padding(padding: EdgeInsets.all(15),),
            animalTitle(DefaultText.mainAttribution, FontStyle.subtitle, Margin.leftPadding),
            const Padding(padding: Margin.betweenTextTitle),
            detailInfo(detail2, FontStyle.detail, Margin.leftPadding),
          ],
        )
    );
  }
  Widget animalTitle(String info, TextStyle style, EdgeInsets margin){
    return Row(
      children: [
        Padding(padding: margin),
        Flexible(child: Text(info, style: style)),
      ],);
  }
  Widget detailInfo(String info, TextStyle style, EdgeInsets margin){
    return Row(
      children: [
        Padding(padding: margin),
        SizedBox(
          width: 350,
          child: Text(info, maxLines: 5, style: style),
        )
      ],);
  }

}