// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class MySizedBoxDemo extends StatelessWidget {
  MySizedBoxDemo();
  @override
    Widget build(BuildContext context) {
      return SizedBox(
        height: 180.0,
        child: Card(
          elevation: 10.0,
          margin: EdgeInsets.all(0.0),
          shape: RoundedRectangleBorder(),
          color: Colors.purple.shade100,
          child: Text('江山如画，\n一时多少豪杰。', style: Theme.of(context).textTheme.display1.copyWith(color: Colors.white)),
        ),
      );
    }
}
