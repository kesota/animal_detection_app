
import 'package:app/view/picture_display_view.dart';
import 'package:app/view_model/newcamera_view_model.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class NewCameraView extends StatefulWidget{
  const NewCameraView({Key? key, required this.camera}) : super(key:key);
  final List<CameraDescription> camera;
  @override
  State<NewCameraView> createState() => _NewCameraState();
}

class _NewCameraState extends State<NewCameraView>{
  final NewCameraViewModel _viewModel = NewCameraViewModel();

  @override
  void initState(){
    super.initState();
    _viewModel.controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.camera[0],
      // Define the resolution to use.
      ResolutionPreset.medium,
    );
    _viewModel.initializeControllerFuture = _viewModel.controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _viewModel.controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          FutureBuilder<void>(
              future: _viewModel.initializeControllerFuture,
              builder:  (BuildContext context, snapshot){
                if (snapshot.connectionState == ConnectionState.done){
                  return Column(
                      children:[
                        const Padding(padding: EdgeInsets.all(40),),
                        CameraPreview(_viewModel.controller),
                   ]);
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }
          ),
          FloatingActionButton(
            onPressed: ()async{

              await _viewModel.takePicture();
              // Push to Displaying Page
              Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) =>
                          PictureDisplayView(_viewModel.image.path)));
              },
            child: const Icon(Icons.camera_alt,),
          ),
        ],
      )
    );
  }
}

