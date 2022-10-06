
import 'package:flutter/material.dart';

abstract class Res{}

extension Margin on Res{
  static const EdgeInsets animalPagePadding1 = EdgeInsets.all(10);
  static const EdgeInsets leftPadding = EdgeInsets.all(10);
  static const EdgeInsets betweenTextTitle = EdgeInsets.all(5);
  static const EdgeInsets afterTitle = EdgeInsets.all(15);
  static const EdgeInsets detailInBetween = EdgeInsets.all(15);
  static const EdgeInsets animalTextMargin = EdgeInsets.only(left:2.5, right: 2.5);
  static const EdgeInsets animalBetween = EdgeInsets.all(2);
  static const EdgeInsets animalBetween2 = EdgeInsets.all(5);

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
  static const String errorTitle = 'エラー:';
  static const String errorDeDefault = 'システムエラー';
  static const String errorNotFoundTitle = '探検開始だ～';
  static const String errorNotFound = '見つかってない動物だよ？\n探しに行こう！';
  static const String errorNecessaryInfoNotFound = '情報取得に失敗しました。\nアプリをアップデートしてください。';
}


extension WidgetParm on Res{
  // Width
  static const  double detailPicWidth = 300;
  static const double animalBoxWidth = 125;
  static const double animalPicWidth = 110;
  static const double animalTextWidth = 90;


  // Height
  static const double detailPicHeight = 175;
  static const double animalBoxHeight = 125;
  static const double animalPicHeight = 90;
  static const double animalTextHeight = 23;

}