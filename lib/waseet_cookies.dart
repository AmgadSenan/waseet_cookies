import 'package:flutter/services.dart';

class WaseetCookies {
  static const MethodChannel _ch = MethodChannel('waseetpro/cookies');

  static Future<String?> getCookies(String url) async {
    return await _ch.invokeMethod<String>('getCookies', {'url': url});
  }

  static Future<bool> clearCookies() async {
    return (await _ch.invokeMethod<bool>('clearCookies')) ?? false;
  }
}
