import 'package:app/view/newcamera.dart';
import 'package:app/view/title_page.dart';
import 'package:app/view/camera_view.dart';
import 'package:app/view/suggested_camera_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // This widget is the root of your application.
      initialRoute:  '/',
      routes: {
        '/': (context) => const MyHomePage(title: 'Flutter Demo Home Page'),
        '/title': (context) => TitleView(),
        '/camera': (context) => CameraView(),
        '/suggested': (context) => SuggestedView(),
        '/newcamera': (context) => NewCameraView(),

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
