
import 'package:logger/logger.dart';


class LoggerManager extends Logger{

  // Factory Constructor: Prevent this class from making multiple instances
  static final LoggerManager _instance = LoggerManager._internal();
  factory LoggerManager(){
    return _instance;
  }
  LoggerManager._internal();

}