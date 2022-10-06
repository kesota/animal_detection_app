
import 'package:flutter/material.dart';

class TitleView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  width: 250,
                  height: 250,
                  color: Colors.blue,
                  child: const Center(
                   child: Text('タイトルロゴ',
                     style: TextStyle(fontSize: 28),
                   )
                  )
              )
            ],
          )
        ],
      )
    );
  }
}