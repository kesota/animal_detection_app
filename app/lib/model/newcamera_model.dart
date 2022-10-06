

import 'package:app/util/logger_manager.dart';
import 'package:camera/camera.dart';

class NewCameraModel{
  final LoggerManager logger = LoggerManager();

  // Take picture, and return photos
  Future<XFile> takePicture(CameraController _controller,
      Future<void> _initializeControllerFuture) async {
    try {
      await _initializeControllerFuture;
      final _picture = await _controller.takePicture();
      logger.d('Successfully Captured');
      return _picture;
    }catch(e) {
      logger.e(e);
      // If error is occurred, return empty XFile
      return XFile('');
    }
  }
}