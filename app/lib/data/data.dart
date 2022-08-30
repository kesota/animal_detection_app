

import 'package:flutter/foundation.dart';

class MyModel extends ChangeNotifier{
  int _counter = 0;
  int get counter => _counter;
  String _name = 'Test';
  String get name => _name;

  void increment() {
    _counter++;
    notifyListeners();
  }
}