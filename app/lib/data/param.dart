
import 'package:flutter/material.dart';

abstract class Res{}

extension Margin on Res{
  static const EdgeInsets animalPagePadding1 = EdgeInsets.all(10);
  static const EdgeInsets leftPadding = EdgeInsets.all(10);
  static const EdgeInsets betweenTextTitle = EdgeInsets.all(5);
  static const EdgeInsets afterTitle = EdgeInsets.all(15);
}

extension FontStyle on Res{
  static const TextStyle name = TextStyle(fontSize: 50, fontWeight: FontWeight.bold);
  static const TextStyle type = TextStyle(fontSize: 12);
  static const TextStyle subtitle = TextStyle(fontSize: 25);
  static const TextStyle detail = TextStyle(fontSize: 18);
}

extension DefaultText on Res{
  static const String mainHabitat = '＊　主な生息地';
  static const String mainAttribution = '＊　主な生態';
}