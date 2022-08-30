

import 'package:flutter/material.dart';

class NewCameraView extends StatefulWidget{
  NewCameraView({Key? key}) : super(key:key);

  @override
  State<NewCameraView> createState() => _NewCameraState();
}

class _NewCameraState extends State<NewCameraView>{
  int _counter = 0;

  void _increment(){
    setState(() {
      _counter++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(15),),
            Container(
              child: Text('$_counter')
            ),
            TextButton(onPressed: (){_increment();}, child: const Text('Push me'))
          ],
        ),
      )
    );
  }

}