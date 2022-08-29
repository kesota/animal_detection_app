import 'package:flutter/material.dart';

class SuggestedView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(45),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 180,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SuggestedView()));
                print('Suggested Camera Page is pushed');},
                icon: Icon(Icons.camera_alt, size: 150,),)
            ),
            Container(child: Text('カメラを使う')),
            const Padding(padding: EdgeInsets.all(80),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(padding: EdgeInsets.only(left:10)),
                Container(
                    width: 100,
                    height: 185,
                    color: Colors.lightBlueAccent,
                    child: const Text('お知らせ',
                      style: TextStyle(fontSize: 20),)
                ),
                const Padding(padding: EdgeInsets.only(left:10)),
                Container(
                    width: 100,
                    height: 185,
                    color: Colors.lightBlueAccent,
                    child: const Text('図鑑',
                      style: TextStyle(fontSize: 20),)
                ),
                const Padding(padding: EdgeInsets.only(left:10)),
                Container(
                    width: 100,
                    height: 185,
                    color: Colors.lightBlueAccent,
                    child: const Text('設定',
                      style: TextStyle(fontSize: 20),)
                ),
                const Padding(padding: EdgeInsets.only(left:10)),
              ],
            )
          ],
        )

    );
  }
}
