// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class MyBaselineDemo extends StatelessWidget {
  MyBaselineDemo();
  @override
    Widget build(BuildContext context) {
      return Baseline(
        baseline: 30.0,
        baselineType: TextBaseline.alphabetic,
        child: Card(
          elevation: 10.0,
          margin: EdgeInsets.all(0.0),
          shape: RoundedRectangleBorder(),
          color: Colors.green.shade700,
          child: Center(
            child: Text('朝发白帝彩云间，\n千里江陵一日还。', style: Theme.of(context).textTheme.display1.copyWith(color: Colors.white))
          )
        ),
      );
    }
}
