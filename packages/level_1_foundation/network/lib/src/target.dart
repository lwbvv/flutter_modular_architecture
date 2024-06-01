import 'http_config.dart';

/// HttpConnector를 이용해 request를 호출할 때 사용되는 클래스이다
class Target {
  Target({
    this.headerOption = const HeaderOption(),
    required this.baseUrl,
    required this.path,
    required this.method,
    this.queryParameters,
    this.body,
  });

  final HeaderOption headerOption;
  final String baseUrl;
  final String path;
  final HttpMethod method;
  final Map<String, dynamic>? queryParameters;
  final Map<String, dynamic>? body;
  // Todo: json 이외의 결과값에 대한 field 추가
}