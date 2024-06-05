import 'package:flutter_test/flutter_test.dart';
import 'package:smart_popup/smart_popup.dart';
import 'package:smart_popup/smart_popup_platform_interface.dart';
import 'package:smart_popup/smart_popup_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockSmartPopupPlatform
    with MockPlatformInterfaceMixin
    implements SmartPopupPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final SmartPopupPlatform initialPlatform = SmartPopupPlatform.instance;

  test('$MethodChannelSmartPopup is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelSmartPopup>());
  });

  test('getPlatformVersion', () async {
    SmartPopup smartPopupPlugin = SmartPopup();
    MockSmartPopupPlatform fakePlatform = MockSmartPopupPlatform();
    SmartPopupPlatform.instance = fakePlatform;

    expect(await smartPopupPlugin.getPlatformVersion(), '42');
  });
}
