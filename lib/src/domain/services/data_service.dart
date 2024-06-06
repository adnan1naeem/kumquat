import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:kumquat_app/src/domain/services/configuration.dart';

import '../../core/mixin/http.dart';
import '../../data/models/json_doc.dart';

typedef UploadProgress = void Function(double message);

class DataService with Http {
  static final DataService _singleton = DataService._instantiate();
  final Dio dio = Dio(BaseOptions(
      baseUrl: ConfigurationService().host,
      contentType: Headers.jsonContentType,
      followRedirects: false));

  final Dio webDio = Dio(BaseOptions(
      baseUrl: ConfigurationService().webServerHost,
      contentType: Headers.jsonContentType,
      followRedirects: false));

  factory DataService() {
    return _singleton;
  }

  DataService._instantiate();

  // void initialise(SessionBloc sessionBloc) {
  //   this.sessionBloc = sessionBloc;
  // }

  void setAuthHeader(String token, String serverToken) {
    dio.options.headers = {
      "Accept": "application/json",
      "Authorization": "Bearer $token",
    };

    setWebServerHeader(serverToken);
  }

  void setWebServerHeader(String session) {
    webDio.options.headers = {
      "Accept": "application/json",
      "Authorization": "Bearer $session",
    };
  }

  void removeAuthHeader() {
    dio.options.headers = {"Content-Type": "application/json"};

    removeWebServerHeader();
  }

  void removeWebServerHeader() {
    webDio.options.headers = {"Content-Type": "application/json"};
  }

  Future<JsonDoc> post(
    String endPoint, {
    dynamic body,
    bool isFormUrlEncoded = false,
    bool isWebServer = false,
  }) async {
    try {
      return await safelyRun<JsonDoc>(() async {
        Response response = isWebServer
            ? await webDio.post(endPoint, data: body)
            : await dio.post(endPoint, data: body);

        return JsonDoc(type: endPoint, data: response.data);
      });
    } catch (e) {
      if (e is UnauthorizedException
          // || (e is ServerError && isWebServer)
          ) {
        rethrow;
      } else {
        rethrow;
      }
    }
  }

  Future<JsonDoc> get(String endPoint,
      {Map<String, dynamic>? query,
      bool isWebServer = false,
      bool needFullBody = false}) async {
    if (isWebServer) {
      webDio.options.baseUrl = ConfigurationService().webServerHost;
    }

    try {
      var response = await safelyRun(() => isWebServer
          ? webDio.get(endPoint, queryParameters: query)
          : dio.get(endPoint, queryParameters: query));
      return JsonDoc(
          type: endPoint,
          data: needFullBody ? response.data : response.data['data']);
    } catch (e) {
      if (e is UnauthorizedException || (e is ServerError && isWebServer)) {
        rethrow;
      } else {
        rethrow;
      }
    }
  }

  Future<JsonDoc> delete(String endPoint,
      {Map<String, dynamic>? params, bool isWebServer = false}) async {
    var response = await safelyRun(() => isWebServer
        ? webDio.delete(endPoint, queryParameters: params)
        : dio.delete(endPoint, queryParameters: params));
    return JsonDoc(type: endPoint, data: response.data);
  }

  Future<JsonDoc> patch(String endPoint,
      {dynamic body, bool isWebServer = false}) async {
    var response = await safelyRun(() => isWebServer
        ? webDio.patch(endPoint, data: jsonEncode(body))
        : dio.patch(endPoint, data: jsonEncode(body)));
    return JsonDoc(type: endPoint, data: response.data);
  }
}
