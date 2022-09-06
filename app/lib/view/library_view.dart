
import 'dart:io';

import 'package:app/util/camera_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LibraryView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Consumer<CameraNotifier>(
      builder:(context, model, child) {
        return Scaffold(
            body: ListView.builder(
              itemCount: model.picturesList.length,
              itemBuilder: (context, index){
                return Column(
                  children: [
                    Container(
                      child: Image.file(File(model.picturesList[index].path)),
                    )
                  ],
                );
              },
            ),
        );
    }
    );
  }
}