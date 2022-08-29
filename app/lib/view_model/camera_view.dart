import 'package:flutter/material.dart';

class CameraView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(25),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 400,
            color: Colors.black,
            child: const Center(
              child: Text('ゴリラ！！',
                  style: TextStyle(fontSize: 50, color: Colors.white,))
            ),
          ),
          const Padding(padding: EdgeInsets.all(15),),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(padding: EdgeInsets.only(left:10)),
              Container(
                width: 100,
                height: 175,
                color: Colors.blue,
                child: const Text('お知らせ',
                  style: TextStyle(),)
              ),
              const Padding(padding: EdgeInsets.only(left:10)),
              Container(
                  width: 100,
                  height: 175,
                  color: Colors.blue,
                  child: const Text('お知らせ',
                    style: TextStyle(),)
              ),
              const Padding(padding: EdgeInsets.only(left:10)),
              Container(
                  width: 100,
                  height: 175,
                  color: Colors.blue,
                  child: const Text('お知らせ',
                    style: TextStyle(),)
              ),
            ],
          )
        ],
      )

    );
  }
}
