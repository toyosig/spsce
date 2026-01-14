import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';

class DeviceHelper {
  static Future<Map<String, String>> getGuestLoginMeta() async {
    final deviceInfoPlugin = DeviceInfoPlugin();
    String deviceId = '';
    String deviceType = '';
    String userAgent = '';

    if (Platform.isAndroid) {
      final androidInfo = await deviceInfoPlugin.androidInfo;
      deviceId = androidInfo.id;
      deviceType = 'android';
      userAgent =
          'Android \\${androidInfo.version.release} - \\${androidInfo.model}';
    } else if (Platform.isIOS) {
      final iosInfo = await deviceInfoPlugin.iosInfo;
      deviceId = iosInfo.identifierForVendor ?? '';
      deviceType = 'ios';
      userAgent =
          'iOS \\${iosInfo.systemVersion} - \\${iosInfo.utsname.machine}';
    } else {
      deviceId = 'web';
      deviceType = 'web';
      userAgent = 'Flutter Web';
    }

    return {
      'deviceId': deviceId,
      'deviceType': deviceType,
      'userAgent': userAgent,
    };
  }
}
