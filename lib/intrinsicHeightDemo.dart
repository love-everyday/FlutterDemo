// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class MyIntrinsicHeightDemo extends StatelessWidget {
  MyIntrinsicHeightDemo();
  @override
    Widget build(BuildContext context) {
      return IntrinsicHeight(
        child: Card(
          elevation: 10.0,
          margin: EdgeInsets.all(0.0),
          shape: RoundedRectangleBorder(),
          color: Colors.red.shade700,
          child: Column(
            children: <Widget>[
              Text('有心栽花花不开，\n无心插柳柳成荫。', style: Theme.of(context).textTheme.display1.copyWith(color: Colors.white)),
              Text('有心栽花花不开，\n无心插柳柳成荫。', style: Theme.of(context).textTheme.display1.copyWith(color: Colors.white)),
            ],
          )
        ),
      );
    }
}
