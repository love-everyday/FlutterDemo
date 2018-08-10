import 'package:flutter/material.dart';
import 'widgetsLayout/widgetsLayoutDemo.dart';
import 'imagePicker/imagePickerDemo.dart';
import 'navigation/navigationDemo.dart';

void main() => runApp(new RootWidget());

class RootWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomeGrid(),
        '/imagePicker': (context) => ImagePickderDemo(),
        '/layout': (context) => MyHomePage(title: 'Wiget Layout',),
        '/navigation': (context) => SampleAppPage(),
      },
    );
  }
}

class HomeGrid extends StatelessWidget {
  final List<dynamic> demosList = [
    {'name': 'Navigation', 'icon': Icons.apps, 'route': '/navigation'},
    {'name': 'ImagePicker', 'icon': Icons.photo_camera, 'route': '/imagePicker'},
    {'name': 'WidgetLayout', 'icon': Icons.view_compact, 'route': '/layout'},
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo'),
      ),
      body: GridView.count(
        padding: EdgeInsets.only(left: 10.0, top: 20.0, right: 10.0),
          crossAxisCount: 2,
          reverse: false,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          children: demosList.map((demo) {
            return RaisedButton(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 20.0),
                    child: Icon(demo["icon"], color: Colors.blueAccent, size: 100.0,),
                  ),
                  Text(demo['name'])
                ],
              ),
              elevation: 1.0,
              highlightElevation: 5.0,
              color: Colors.white,
              highlightColor: Colors.white,
              onPressed: () {
                Navigator.pushNamed(context, demo['route']);
              },
            );
          }).toList(),

      ),
    );
  }
}