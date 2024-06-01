import 'dart:io';


enum Accept {
  json('application/json'),
  textPlain('text/plain');

  static const String key = 'accept';

  final String value;

  const Accept(this.value);
}

enum ContentType {
  json('application/json; charset=utf-8'),
  urlEncoded('application/x-www-form-urlencoded;charset=utf-8'),
  textPlain('text/plain');

  static const String key = 'content-type';

  final String value;

  const ContentType(this.value);
}

class UserAgent {
  final String _appName;
  final String _appVersion;
  final String _os;
  final String _deviceModel;
  final String _systemVersion;

  UserAgent._({
    required String appName,
    required String appVersion,
    required String os,
    required String deviceModel,
    required String systemVersion,
  })  : _appName = appName,
        _appVersion = appVersion,
        _os = os,
        _deviceModel = deviceModel,
        _systemVersion = systemVersion;

// static Future<UserAgent> create({
//   required DeviceInfoPlugin deviceInfo,
//   required PackageInfo packageInfo,
// }) async {
//   PackageInfo packageInfo = await PackageInfo.fromPlatform();
//   final String appName = packageInfo.appName;
//   final String appVersion = packageInfo.version;
//   final String os;
//   final String deviceModel;
//   final String systemVersion;
//
//   if (Platform.isAndroid) {
//     os = 'Android';
//     final AndroidDeviceInfo device = await deviceInfo.androidInfo;
//
//     deviceModel = device.model;
//     systemVersion = device.version.incremental;
//   } else if (Platform.isIOS) {
//     os = 'iOS';
//     final IosDeviceInfo device = await deviceInfo.iosInfo;
//
//     deviceModel = device.model;
//     systemVersion = device.systemVersion;
//   } else {
//     os = '';
//   }
//
//   // return UserAgent._(appName: appName, appVersion: appVersion, os: os, deviceModel: deviceModel, systemVersion: systemVersion);
// }
}

class HeaderOption {
  final ContentType contentType;
  final Map<String, dynamic>? customHeaders;

  const HeaderOption({
    this.contentType = ContentType.json,
    this.customHeaders,
  });
}

enum HttpMethod {
  get('GET'),
  post('POST'),
  put('PUT'),
  patch('PATCH'),
  delete('DELETE');

  final String rawValue;

  const HttpMethod(this.rawValue);
}
