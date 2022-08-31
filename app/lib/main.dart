import 'package:app/view/newcamera.dart';
import 'package:app/view/picture_display_view.dart';
import 'package:app/view/title_page.dart';
import 'package:app/view/camera_view.dart';
import 'package:app/view/suggested_camera_view.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // This will list all the available cameras
  final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.
  final firstCamera = cameras.first;
  runApp(MyApp(camera: cameras));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.camera}) : super(key: key);
  final List<CameraDescription> camera;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // This widget is the root of your application.
      initialRoute:  '/',
      routes: {
        '/': (context) => const MyHomePage(title: 'Sample App'),
        '/title': (context) => TitleView(),
        '/camera': (context) => CameraView(),
        '/suggested': (context) => SuggestedView(),
        '/newcamera': (context) => NewCameraView(camera: camera),
        '/newcamera/photo':(context) => PictureDisplayView(''),

      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _moveToPage('/title', 'Title Page is pushed', 'Move to Title'),
            _moveToPage('/camera', 'Camera Page is pushed', 'Move to Camera'),
            _moveToPage('/suggested', 'Suggested Page is pushed',
                'Move to Suggested'),
            _moveToPage('/newcamera', 'newcamera Page is pushed',
                'Move to newcamera'),
          ]
        ),
      ),
    );
  }
  Widget _moveToPage(String route, String log, String text){
    return TextButton(
      onPressed: () {
        Navigator.of(context).pushNamed(route);
        print(log);
      },
      child: Text(text),);
  }
}
