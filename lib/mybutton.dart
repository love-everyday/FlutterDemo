// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  MyButton(): super(key: Key('hahah')) {
    print('MyButton create');
  }
  @override
    Widget build(BuildContext context) {
      return GestureDetector(
        onTap: () {
          print('Tap Me!');
        },
        child: Container(
          height: 36.0,
          width: 50.0,
          padding: const EdgeInsets.all(8.0),
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Colors.lightGreen[500]
          ),
          child: const Center(
            child: const Text(
              'BBQ',
              style: TextStyle(
                color: Colors.white
              )
            ),
          ),
        ),
      );
    }
}
