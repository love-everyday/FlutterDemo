// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class MyConstrainedBoxDemo extends StatelessWidget {
  MyConstrainedBoxDemo();
  @override
    Widget build(BuildContext context) {
      return ConstrainedBox(
        constraints: BoxConstraints(maxHeight: 100.0),
        child: Card(
          elevation: 10.0,
          margin: EdgeInsets.all(0.0),
          shape: RoundedRectangleBorder(),
          color: Colors.orange.shade700,
          // height: 100.0,
          child: Center(
            child: Text('醉卧沙场君莫笑，\n古来征战几人回。', style: Theme.of(context).textTheme.display1.copyWith(color: Colors.white))
          )
        ),
      );
    }
}
