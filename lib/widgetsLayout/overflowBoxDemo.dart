// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class MyOverflowBoxDemo extends StatelessWidget {
  MyOverflowBoxDemo();
  @override
    Widget build(BuildContext context) {
      return Container(
        constraints: BoxConstraints(maxHeight: 200.0),
        child: OverflowBox(
          alignment: Alignment.topCenter,
          maxHeight: 240.0,
          child: Card(
            elevation: 10.0,
            margin: EdgeInsets.all(0.0),
            shape: RoundedRectangleBorder(),
            color: Colors.pink.shade700,
            child: Text('如欲平治天下，\n当今之世，\n舍我其谁也？\n\n\n\n\n', style: Theme.of(context).textTheme.display1.copyWith(color: Colors.white)),
          ),
        ),
      );
    }
}
