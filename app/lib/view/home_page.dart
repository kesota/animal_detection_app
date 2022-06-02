
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 100,),
            Row(
              children: [
                TextButton(
                  child: const Text('Move to Counter'),
                  onPressed: (){
                    print('Counter Clicked');
                    Navigator.of(context).pushNamed('/test');
                  },
                )
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              children: [
                TextButton(
                  child: const Text('Move to Animal_detect'),
                  onPressed: (){
                    print('Animal_detect Clicked');
                  },
                )
              ],
            ),
          ],
        ),
      )
    );
  }




}