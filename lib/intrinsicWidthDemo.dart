// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class MyIntrinsicWidthDemo extends StatelessWidget {
  MyIntrinsicWidthDemo();
  @override
    Widget build(BuildContext context) {
      return IntrinsicWidth(
        // stepHeight: 2.2,
        child: Card(
          elevation: 10.0,
          margin: EdgeInsets.all(0.0),
          shape: RoundedRectangleBorder(),
          color: Colors.black26,
          child: Column(
            children: <Widget>[
              Text('望西都，意踌躇。\n伤心秦汉经行处', style: Theme.of(context).textTheme.display1.copyWith(color: Colors.white)),
              Text('宫阙万千都做了土。\n兴，百姓苦；\n亡，百姓苦。', style: Theme.of(context).textTheme.display1.copyWith(color: Colors.white)),
            ],
          )
        ),
      );
    }
}
