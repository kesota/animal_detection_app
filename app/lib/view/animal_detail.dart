

import 'package:flutter/material.dart';

class AnimalDetailView extends StatelessWidget{
  AnimalDetailView({Key? key, required this.name, required this.type,
    required this.detail1, required this.detail2}) : super(key:key);

  final String name;
  final String type;
  final String detail1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.transparent,
        backgroundColor: Colors.white12,
        elevation: 0,
      ),
      body: Column(
          children: [
            const Padding(padding: EdgeInsets.all(10)),
            Row(
              children: [
                const Padding(padding: EdgeInsets.all(10)),
                Text(name, style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),),
            ],),
            Row(children: [
              Padding(padding: EdgeInsets.all(10)),
              Text(type,style: const TextStyle(fontSize: 12),),
            ],),
            const Padding(padding: EdgeInsets.all(15),),
            Container(
              child: Icon(Icons.animation, size: 100),
            ),
            const Padding(padding: EdgeInsets.all(15),),
            Row(children: [
              Padding(padding: EdgeInsets.all(10)),
              Text('＊　主な生息地', style: TextStyle(fontSize: 25),),
            ],),
            const Padding(padding: EdgeInsets.all(5),),
            Row(children: [
              Padding(padding: EdgeInsets.all(10)),
              SizedBox(
                width: 350,
                child: Text(detail1, maxLines: 5, style: TextStyle(fontSize: 18)),
              )
            ],),
            const Padding(padding: EdgeInsets.all(15),),
            Row(children: [
              Padding(padding: EdgeInsets.all(10)),
              Text('＊　主な生態', style: TextStyle(fontSize: 25),),
            ],),
            const Padding(padding: EdgeInsets.all(5),),
            Row(children: [
              Padding(padding: EdgeInsets.all(10)),
              SizedBox(
                width: 350,
                child: Text(detail2, maxLines: 5, style: TextStyle(fontSize: 18)),
              )
            ],),
          ],
        )
    );
  }

  final String detail2;
}