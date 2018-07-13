// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class MyLimitedBoxDemo extends StatelessWidget {
  MyLimitedBoxDemo();
  @override
    Widget build(BuildContext context) {
      return LimitedBox(
        maxWidth: 100.0,
        maxHeight: 120.0, //限制高度最大为120。
        child: Card(
          elevation: 10.0,
          margin: EdgeInsets.all(0.0),
          shape: RoundedRectangleBorder(),
          color: Colors.blue.shade700,
          child: Text('义之所在，\n虽万千人，\n吾往矣！', style: Theme.of(context).textTheme.display1.copyWith(color: Colors.white)),
        ),
      );
    }
}
