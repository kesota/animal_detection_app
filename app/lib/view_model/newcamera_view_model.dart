
import 'package:app/util/logger_manager.dart';
import 'package:camera/camera.dart';

import '../model/newcamera_model.dart';

class NewCameraViewModel{
  late CameraController controller;
  late Future<void> initializeControllerFuture;
  XFile image = XFile('');

  final NewCameraModel _model = NewCameraModel();
  final LoggerManager _logger = LoggerManager();

  // Method: Take a picture and store taken picture to image
  Future<void> takePicture() async{
    try {
      image = await _model.takePicture(controller, initializeControllerFuture);
    } catch (e) {
      _logger.e(e);
    }
  }
}