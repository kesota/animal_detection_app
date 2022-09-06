

import 'package:app/util/camera_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TestView extends StatefulWidget{
  @override
  State<TestView> createState() => _TestView();
}
class _TestView extends State<TestView>{
  @override
  Widget build(BuildContext context){
    return Consumer<CameraNotifier>(
      builder: (context, model, child){
        return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Column(
              children: [
                Container(
                  child: Text(model.fruit)
                ),
                TextButton(
                    onPressed: (){model.changeFruit('newFruit');},
                    child:Text('Try reflect the changes?'))
              ],
            ),
          )
        );
      },
    );
  }
}