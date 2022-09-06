import 'package:app/util/camera_notifier.dart';
import 'package:app/util/logger_manager.dart';
import 'package:app/view/animal_detail.dart';
import 'package:app/view/newcamera.dart';
import 'package:app/view/picture_display_view.dart';
import 'package:app/view/test.dart';
import 'package:app/view/title_page.dart';
import 'package:app/view/camera_view.dart';
import 'package:app/view/suggested_camera_view.dart';
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
            '/camera': (context) => CameraView(),
            '/suggested': (context) => SuggestedView(),
            '/newcamera': (context) => NewCameraView(camera: camera, flgChanger: 1,),
            '/newcamera/suggest': (context) => NewCameraView(camera: camera, flgChanger: 100),
            '/newcamera/photo':(context) => PictureDisplayView(XFile('')),
            '/Test': (context) => TestView(),
            '/animalDetail':(context) => AnimalDetailView(name: '', type: '', detail1: '', detail2: '',),

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
                  _moveToPage('/camera', 'Camera Page is pushed', 'Move to Camera'),
                  _moveToPage('/suggested', 'Suggested Page is pushed',
                      'Move to Suggested'),
                  _moveToPage('/newcamera', 'newcamera Page is pushed',
                      'Move to newcamera'),
                  _moveToPage('/newcamera/suggest', 'second camera Page is pushed',
                      'Move to suggested camera'),
                  _moveToPage('/Test', 'Test page is pushed', 'Try Change Notifier'),
                  _moveToPageParam('/animalDetail', 'Gorilla',['Gorilla', 'ゴリラ科ゴリラ目',
                    '草加在住。　aaaaaaaaaaaaaaa。 testestestestestestest',
                    'ドラミングはコミュニケーションツール。動物園でドラミングされたら、怒っているかも！ testestestestestestestestestes'] ),
                  _moveToPageParam('/animalDetail', 'Kon', ['Kon', '人目',
                  '草加在住。フェスで頻繁目撃されているaaaaaaaaaaaaaaa。 testestestestestestest',
                    'エレキギターを引き連れ東京の夜の街を練り歩く事を趣味にしている。夜更かししがち。 testestestestestestestestestes'])

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
  Widget _moveToPageParam(String route, String text, List<String> animalInfo){
    final LoggerManager _logger = LoggerManager();
    return TextButton(
      onPressed: () {
        Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) =>
                    AnimalDetailView(name: animalInfo[0], type: animalInfo[1],
                      detail1: animalInfo[2], detail2: animalInfo[3]
                    )));
        _logger.d(text);
      },
      child: Text(text),);
  }
}
