import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:waseet_cookies/waseet_cookies_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelWaseetCookies platform = MethodChannelWaseetCookies();
  const MethodChannel channel = MethodChannel('waseet_cookies');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
