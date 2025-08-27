import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'waseet_cookies_platform_interface.dart';

/// An implementation of [WaseetCookiesPlatform] that uses method channels.
class MethodChannelWaseetCookies extends WaseetCookiesPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('waseet_cookies');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
