

// mixin Http {
//   handleDioException(DioError error) {
//     RequestOptions request = error.requestOptions;
//     String method = request.method;
//     String url = request.path.toString();
//     int? code = error.response?.statusCode;
//     var requestBody = request.data;
//     if (error.response == null) throw NoNetworkError();
//
//     dynamic responseBody = error.response?.data;
//     switch (error.type) {
//       case DioErrorType.connectTimeout:
//         throw NoNetworkError();
//       case DioErrorType.sendTimeout:
//         throw NetworkError();
//       case DioErrorType.receiveTimeout:
//         throw NetworkError();
//       case DioErrorType.response:
//         _handleErrorStatus(
//             code: code,
//             method: method,
//             url: url,
//             requestBody: requestBody,
//             responseBody: responseBody);
//         break;
//       case DioErrorType.cancel:
//         throw NetworkError();
//       case DioErrorType.other:
//         if (error.error is SocketException) {
//           throw NetworkError();
//         } else {
//           throw UnknownException();
//         }
//     }
//   }
//
//   _handleErrorStatus(
//       {int? code,
//         required String method,
//         required String url,
//         dynamic requestBody,
//         dynamic responseBody}) {
//     if (code == 204) {
//       return null;
//     } else if (code == 400) {
//       throw BadRequestException(method, code!, requestBody, responseBody);
//     } else if (code == 401) {
//       throw UnauthorizedException(method, code!);
//     } else if (code == 403) {
//       throw ForbiddenException(method, code!);
//     } else if (code == 404) {
//       throw NotFoundException(method, code!, requestBody, responseBody);
//     } else if (code == 422) {
//       throw UnProcessableException(method, code!, requestBody, responseBody);
//     } else if (code != null && code > 400 && code < 500) {
//       throw ClientError(
//           method: method,
//           statusCode: code,
//           requestBody: requestBody,
//           responseBody: responseBody);
//     } else if (code != null && code >= 500 && code <= 599) {
//       throw ServerError(
//           method: method,
//           statusCode: code,
//           requestBody: requestBody.toString(),
//           responseBody: responseBody.toString());
//     } else {
//       throw HttpStatusException(
//         method,
//         code,
//         statusCode: code,
//         requestBody: requestBody,
//         responseBody: responseBody,
//       );
//     }
//   }
//
//   Future<T> safelyRun<T>(Future<T> Function() method) async {
//     try {
//       return await method();
//     } on DioError catch (error) {
//       // print('err${error}');
//       throw handleDioException(error);
//     } catch (error) {
//       // print('catch${error}');
//       throw ServerError();
//     }
//   }
// }

class InvalidRecordException implements Exception {}

class HttpStatusException implements Exception {
  String? method;
  int? code;
  dynamic responseBody;
  dynamic requestBody;
  int? statusCode;

  HttpStatusException(
      this.method,
      this.code, {
        this.statusCode,
        this.requestBody,
        this.responseBody,
      });

  @override
  String toString() =>
      "HTTP error: $method $code\n\n$requestBody\n$responseBody";
}

class BadRequestException extends HttpStatusException {
  BadRequestException(
      String method,
      int code,
      dynamic requestBody,
      dynamic responseBody,
      ) : super(method, code, requestBody: requestBody, responseBody: responseBody);

  @override
  String toString() => "$responseBody";
}

class ForbiddenException extends HttpStatusException {
  ForbiddenException(String method, int code) : super(method, code);

  @override
  String toString() => "Forbidden request: $method $code";
}

class UnauthorizedException extends HttpStatusException {
  UnauthorizedException(String method, int code) : super(method, code);

  @override
  String toString() => "Unauthorized request: $method $code";
}

class NotFoundException extends HttpStatusException {
  NotFoundException(
      String method,
      int code,
      dynamic requestBody,
      dynamic responseBody,
      ) : super(method, code, requestBody: requestBody, responseBody: responseBody);

  @override
  String toString() => "$responseBody";
}

class UnProcessableException extends HttpStatusException {
  UnProcessableException(
      String method,
      int code,
      String requestBody,
      dynamic responseBody,
      ) : super(method, code, requestBody: requestBody, responseBody: responseBody);

  @override
  String toString() =>
      "Unprocessable request: $method $code\n\n$requestBody\n$responseBody";
}

class ClientError extends HttpStatusException {
  ClientError({
    required String method,
    // required String url,
    int? statusCode,
    String? requestBody,
    dynamic responseBody,
  }) : super(
    method,
    statusCode,
    statusCode: statusCode,
    requestBody: requestBody,
    responseBody: responseBody,
  );

  @override
  String toString() =>
      "Client request error: $method $statusCode\n\n$requestBody\n$responseBody";
}

class ServerError extends HttpStatusException {
  ServerError({
    String? method,
    int? statusCode,
    dynamic requestBody,
    dynamic responseBody,
  }) : super(
    method,
    statusCode,
    statusCode: statusCode,
    requestBody: requestBody,
    responseBody: responseBody,
  );

  @override
  String toString() =>
      "Server processing error: $method $statusCode\n\n$requestBody\n$responseBody";
}

class NetworkError implements Exception {}

class NoNetworkError implements Exception {}

class InvalidDataReceived implements Exception {}

class UnknownException implements Exception {}
