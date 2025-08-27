import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'waseet_cookies_method_channel.dart';

abstract class WaseetCookiesPlatform extends PlatformInterface {
  /// Constructs a WaseetCookiesPlatform.
  WaseetCookiesPlatform() : super(token: _token);

  static final Object _token = Object();

  static WaseetCookiesPlatform _instance = MethodChannelWaseetCookies();

  /// The default instance of [WaseetCookiesPlatform] to use.
  ///
  /// Defaults to [MethodChannelWaseetCookies].
  static WaseetCookiesPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [WaseetCookiesPlatform] when
  /// they register themselves.
  static set instance(WaseetCookiesPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
