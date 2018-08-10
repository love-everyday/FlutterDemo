// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class MyFractionallySizedBoxDemo extends StatelessWidget {
  MyFractionallySizedBoxDemo();
  @override
    Widget build(BuildContext context) {
      return Container(
        height: 200.0,
        // width: 10.0,
        child: FractionallySizedBox(
          // widthFactor: 5.0,
          heightFactor: 0.5,
          child: Card(
            elevation: 10.0,
            margin: EdgeInsets.all(0.0),
            shape: RoundedRectangleBorder(),
            color: Colors.yellow.shade700,
            child: Center(
              child: Text('凭君莫话封侯事，\n一将功成万骨枯。', style: Theme.of(context).textTheme.display1.copyWith(color: Colors.white))
            )
          ),
        ),
      );
    }
}
