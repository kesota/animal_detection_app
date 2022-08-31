
import 'dart:io';

import 'package:flutter/material.dart';

class PictureDisplayView extends StatelessWidget{
  String imagePath;
  PictureDisplayView(this.imagePath, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // In case of handling if $imagePath is null / empty
    return
      imagePath.isNotEmpty ?
      Container(
          color: Colors.red,
          child: Image.file(File(imagePath))
      ) :
      const Text('None');
  }
}