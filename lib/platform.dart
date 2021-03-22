
import 'dart:async';

import 'package:flutter/services.dart';

class Platform {
  static const MethodChannel _channel =
      MethodChannel('dapp');

  static Future<String> get version async {
    return await _channel.invokeMethod('getPlatformVersion');
  }
}
