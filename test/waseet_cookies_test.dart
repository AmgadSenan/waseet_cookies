import 'package:flutter_test/flutter_test.dart';
import 'package:waseet_cookies/waseet_cookies.dart';
import 'package:waseet_cookies/waseet_cookies_platform_interface.dart';
import 'package:waseet_cookies/waseet_cookies_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockWaseetCookiesPlatform
    with MockPlatformInterfaceMixin
    implements WaseetCookiesPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final WaseetCookiesPlatform initialPlatform = WaseetCookiesPlatform.instance;

  test('$MethodChannelWaseetCookies is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelWaseetCookies>());
  });

  test('getPlatformVersion', () async {
    WaseetCookies waseetCookiesPlugin = WaseetCookies();
    MockWaseetCookiesPlatform fakePlatform = MockWaseetCookiesPlatform();
    WaseetCookiesPlatform.instance = fakePlatform;

    expect(await waseetCookiesPlugin.getPlatformVersion(), '42');
  });
}
