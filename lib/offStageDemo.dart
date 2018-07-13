// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class MyOffStageDemo extends StatelessWidget {
  MyOffStageDemo();
  @override
    Widget build(BuildContext context) {
      return Offstage(
        offstage: true,
        child: Card(
          elevation: 10.0,
          margin: EdgeInsets.all(0.0),
          shape: RoundedRectangleBorder(),
          color: Colors.lightGreen.shade700,
          child: Text('时来天地皆同力，\n运去英雄不自由。', style: Theme.of(context).textTheme.display1.copyWith(color: Colors.white)),
        ),
        );
    }
}
