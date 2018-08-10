import 'package:flutter/material.dart';
import 'aspectRatio.dart';
import 'constrainedBoxDemo.dart';
import 'baselineDemo.dart';
import 'fractionallySizedBoxDemo.dart';
import 'intrinsicHeightDemo.dart';
import 'intrinsicWidthDemo.dart';
import 'limitedBoxDemo.dart';
import 'offStageDemo.dart';
import 'overflowBoxDemo.dart';
import 'sizedBoxDemo.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key) {
    print('MyHomePage create');
  }

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  _MyHomePageState() {
    print('_MyHomePageState create');
  }
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new ListView(
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
            new Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            new Container(
              constraints: new BoxConstraints.expand(
                height: Theme.of(context).textTheme.display1.fontSize * 1.1 + 200.0,
              ),
              padding: const EdgeInsets.all(8.0),
              color: Colors.teal.shade700,
              alignment: Alignment.center,
              child: new Text('Good Morning, China!', style: Theme.of(context).textTheme.display1.copyWith(color: Colors.white)),
              foregroundDecoration: new BoxDecoration(
                image: new DecorationImage(
                  // image: new NetworkImage(''),
                  image: new NetworkImage('https://pic4.zhimg.com/v2-8afd84553f9a9348f24324fbdfd33ce8_b.jpg'),
                  centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
                ),
              ),
              transform: new Matrix4.rotationZ(0.1),
            ),
            MyAspectRatioDemo(),
            MyConstrainedBoxDemo(),
            MyBaselineDemo(),
            MyFractionallySizedBoxDemo(),
            MyIntrinsicHeightDemo(),
            MyIntrinsicWidthDemo(),
            MyLimitedBoxDemo(),
            MyOffStageDemo(),
            MyOverflowBoxDemo(),
            MySizedBoxDemo(),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
