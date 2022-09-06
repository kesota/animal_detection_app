
import 'package:app/util/camera_notifier.dart';
import 'package:app/view/picture_display_view.dart';
import 'package:app/view_model/newcamera_view_model.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      ResolutionPreset.max,
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
                        CameraPreview(
                            _viewModel.controller,
                            child: Row(
                              children: [
                                const Padding(padding: EdgeInsets.all(2.5)),
                                Container(
                                  width: 50,
                                  height: 100,
                                  decoration: _boxBorder(),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(Icons.home,),
                                      Icon(Icons.group),
                                      Icon(Icons.menu_book_sharp)
                                    ],
                                  ),
                                ),
                            ],
                          )),
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



  Decoration _boxBorder(){
    return const BoxDecoration(
      border: Border(
        left: BorderSide(
          color: Colors.black,
          width: 2,
        ),
        top: BorderSide(
          color: Colors.black,
          width: 2,
        ),
        right: BorderSide(
          color: Colors.black,
          width: 2,
        ),
        bottom: BorderSide(
          color: Colors.black,
          width: 2,
        ),
      ),
    );
  }
}

