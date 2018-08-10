// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class MyAspectRatioDemo extends StatelessWidget {
  MyAspectRatioDemo();
  @override
    Widget build(BuildContext context) {
      return AspectRatio(
        aspectRatio: 4.0, //宽度是高度的4倍
        child: Container(
          color: Colors.teal.shade700,
          alignment: Alignment.center,
          // width: 20.0,
          // height: 20.0,
          child: new Text('劝君更尽一杯酒，\n西出阳关无故人。', style: Theme.of(context).textTheme.display1.copyWith(color: Colors.white)),
        ),
      );
    }
}
