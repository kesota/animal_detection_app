

import 'package:camera/camera.dart';

class NewCameraModel{
  Future<XFile> takePicture(CameraController _controller,
      Future<void> _initializeControllerFuture) async {
    try {
      await _initializeControllerFuture;
      final _picture = await _controller.takePicture();
      print('Successfully Captured');

      return _picture;
    }catch(e) {
      print(e);
      // If error is occurred, return empty XFile
      return XFile('');
    }
  }
}