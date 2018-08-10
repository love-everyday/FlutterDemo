import 'dart:async';

import 'package:flutter/services.dart';

class ShareActive {
  static const MethodChannel _channel =
      const MethodChannel('share_active');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static shareActive({String text, String url, String filePath}){
    _channel.invokeMethod('shareActive', <String, dynamic>{
      'text': text, 'url': url, 'filePath': filePath
    });
  }
}
