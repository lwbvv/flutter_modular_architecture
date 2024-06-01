import 'package:dio/dio.dart' as dio;

/// network library를 사용할 때 dio를 밖으로 노출시키지 않기 위해
/// typedef로 dio를 참조하지 않고 network만 참조하도록 함.
typedef Response = dio.Response;

sealed class HttpConnectionError extends Error {}

class NoResponseValueError extends HttpConnectionError {
  NoResponseValueError();
}

class BackendError extends HttpConnectionError {
  final String? status;
  final String? errorCode;
  final String? description;

  BackendError({
    this.status,
    this.errorCode,
    this.description,
  });
}

enum ConnectionErrorType {
  /// url이 열릴 때 시간 초과
  connectTimeout,

  /// 전송 시간 초과
  sendTimeout,

  /// 받을 때 시간 초과
  receiveTimeout,

  // 인증서 오류
  badCertificate,

  /// 서버 응답값이 잘못 된 경우
  badResponse,

  /// 요청이 취소된 경우
  cancel,

  // `xhr.onError` 또는 SocketExceptions가 일어난 경우
  connectionError,

  /// 그 외
  other;
}

class ConnectionError extends HttpConnectionError {
  final Response? response;
  final ConnectionErrorType type;

  ConnectionError({
    required this.type,
    this.response,
  });

  factory ConnectionError.fromRawError({
    required dio.DioExceptionType type,
    Response? response,
  }) {
    switch (type) {
      case dio.DioExceptionType.connectionTimeout:
        return ConnectionError(type: ConnectionErrorType.connectTimeout, response: response);
      case dio.DioExceptionType.sendTimeout:
        return ConnectionError(type: ConnectionErrorType.sendTimeout, response: response);
      case dio.DioExceptionType.receiveTimeout:
        return ConnectionError(type: ConnectionErrorType.receiveTimeout, response: response);
      case dio.DioExceptionType.badCertificate:
        return ConnectionError(type: ConnectionErrorType.badCertificate, response: response);
      case dio.DioExceptionType.badResponse:
        return ConnectionError(type: ConnectionErrorType.badResponse, response: response);
      case dio.DioExceptionType.cancel:
        return ConnectionError(type: ConnectionErrorType.cancel, response: response);
      case dio.DioExceptionType.connectionError:
        return ConnectionError(type: ConnectionErrorType.other, response: response);
      case dio.DioExceptionType.unknown:
        return ConnectionError(type: ConnectionErrorType.other, response: response);
    }
  }
}
