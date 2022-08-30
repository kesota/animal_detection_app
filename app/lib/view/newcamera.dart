

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class NewCameraView extends StatefulWidget{
  NewCameraView({Key? key, required this.camera}) : super(key:key);
  final List<CameraDescription> camera;
  @override
  State<NewCameraView> createState() => _NewCameraState();
}

class _NewCameraState extends State<NewCameraView>{
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  late XFile image;

  @override
  void initState(){
    super.initState();
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.camera[0],
      // Define the resolution to use.
      ResolutionPreset.medium,
    );
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          Container(
              child: FutureBuilder<void>(
                  future: _initializeControllerFuture,
                  builder:  (BuildContext context, snapshot){
                    if (snapshot.connectionState == ConnectionState.done){
                      return CameraPreview(_controller);
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  }
              )
          ),
          FloatingActionButton(onPressed: ()async{
            try{
              await _initializeControllerFuture;
              image = await _controller.takePicture();
              print('Successfully Captured');
              _controller.initialize();
            }catch(error){
              print(error);
            }
          }, 
            child: const Icon(Icons.camera_alt,),
          ),

        ],
      )

    );
  }
}