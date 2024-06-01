import 'package:common/common.dart';
import 'package:dio/dio.dart' as dio;

import 'http_config.dart';
import 'target.dart';
import 'type.dart';


enum InterceptorAction {
  next,
  reject;
}

/// network library를 사용할 때 dio를 밖으로 노출시키지 않기 위해
/// typedef로 dio를 참조하지 않고 network만 참조하도록 함.
typedef Interceptor = dio.Interceptor;
typedef ResponseType = dio.ResponseType;
typedef CancelToken = dio.CancelToken;
typedef ProgressCallback = dio.ProgressCallback;
typedef RequestOptions = dio.RequestOptions;
typedef RequestInterceptorHandler = dio.RequestInterceptorHandler;
typedef NetworkError = dio.DioError;
typedef ErrorInterceptorHandler = dio.ErrorInterceptorHandler;
typedef ResponseInterceptorHandler = dio.ResponseInterceptorHandler;

/// 서비스에서 사용하는 네트워크 라이브러리를 조금 더 쓰기 쉽게 만들고
/// third party library인 dio와 서비스간의 직접적인 의존을 격리시키기 위한 래퍼 클래스이다
class HttpConnector {
  static final HttpConnector instance = HttpConnector._();
  /// [connectTimeout], [receiveTimeout], [sendTimeout]에 쓰임
  static const int _timeoutMilliseconds = 60 * 1000;

  late final dio.Dio _connector;

  HttpConnector._();

  /// 어플리케이션의 시작지점에서 해당 함수를 호출해서 httpConnector를 초기화 시켜줘야 함
  /// [_connector.interceptors]가 계속 바뀌게 되면 버그를 초래할 수 있으므로
  /// create에서만 추가할 수 있도록함
  factory HttpConnector.create(List<Interceptor> interceptors) {
    instance._connector = dio.Dio(dio.BaseOptions(
      connectTimeout: Duration(milliseconds: _timeoutMilliseconds),
      receiveTimeout: Duration(milliseconds: _timeoutMilliseconds),
      sendTimeout: Duration(milliseconds: _timeoutMilliseconds),
    ));
    instance._connector.interceptors.addAll(interceptors);
    return instance;
  }

  Future<Result<Response, HttpConnectionError>> request(
      Target target, {
        ResponseType responseType = ResponseType.json,
        CancelToken? cancelToken,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
      }) async {
    assert(_connector != null, '_connector가 null이야 create를 호출해서 인스턴스를 초기화해');
    try {
      final Response response = await _connector.request(
        target.baseUrl + target.path,
        data: target.body,
        queryParameters: target.queryParameters,
        options: dio.Options(
          method: target.method.rawValue,
          contentType: target.headerOption.contentType.value,
          responseType: responseType,
        ),
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      response.data = response.data['data'];

      if (target.method == HttpMethod.get && response.data == null) {
        assert(true, 'data가 없어 한 번 확인해 봐');
        return Result.failure(NoResponseValueError());
      }

      return Result.success(response);
    } on dio.DioException catch (e) {
      print('에러발생111111 ${e}');
      return Result.failure(ConnectionError.fromRawError(type: e.type, response: e.response));
    } catch (e) {
      print('에러발생 ${e}');
      return Result.failure(ConnectionError(type: ConnectionErrorType.other));
    }
  }
}
