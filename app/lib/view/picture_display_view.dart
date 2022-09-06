
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class PictureDisplayView extends StatelessWidget{
  XFile imagePath;
  PictureDisplayView(this.imagePath, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // In case of handling if $imagePath is null / empty
    return
      imagePath.path.isNotEmpty ?
      Container(
          color: Colors.red,
          child: Image.file(File(imagePath.path))
      ) :
      const Text('None');
  }
}