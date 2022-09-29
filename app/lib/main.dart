import 'package:app/util/camera_notifier.dart';
import 'package:app/util/logger_manager.dart';
import 'package:app/view/animal_detail.dart';
import 'package:app/view/animal_guide_view.dart';
import 'package:app/view/newcamera.dart';
import 'package:app/view/picture_display_view.dart';
import 'package:app/view/test.dart';
import 'package:app/view/title_page.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    return ChangeNotifierProvider(
        create: (context) => CameraNotifier(),
        child: MaterialApp(
          title: 'Sample App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          // This widget is the root of your application.
          initialRoute:  '/',
          routes: {
            '/': (context) => const MyHomePage(title: 'Sample App'),
            '/title': (context) => TitleView(),
            '/newcamera': (context) => NewCameraView(camera: camera, flgChanger: 1,),
            '/newcamera/suggest': (context) => NewCameraView(camera: camera, flgChanger: 100),
            '/newcamera/photo':(context) => PictureDisplayView(XFile('')),
            '/Test': (context) => TestView(),
            '/animalDetail':(context) => AnimalDetailView(name: '', type: '', detail1: '', detail2: '',),
            '/animalGuide': (context) => const AnimalGuide(),

          },
        ),
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
                  _moveToPage('/newcamera', 'newcamera Page is pushed',
                      'Move to Camera'),
                  _moveToPage('/newcamera/suggest', 'second camera Page is pushed',
                      'Move to suggested camera with Library'),
                  _moveToPage('/Test', 'Test page is pushed', 'Try Change Notifier'),
                  _moveToPage('/animalGuide', 'Animal Guide',
                      '図鑑ページ'),

                ]
            ),
          ),
        );
  }
  Widget _moveToPage(String route, String log, String text){
    final LoggerManager _logger = LoggerManager();
    return TextButton(
      onPressed: () {
        Navigator.of(context).pushNamed(route);
        _logger.d(log);
      },
      child: Text(text),);
  }
}
