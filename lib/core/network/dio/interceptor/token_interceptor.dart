import 'package:dio/dio.dart';

import '../../../../data/data.dart';
import '../../../core.dart';

class TokenInterceptors extends Interceptor {
  var token;

  final SharedPrefs _sharedPrefs = SharedPrefs();
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.baseUrl = ApiRoutes.baseUrl;

    await _sharedPrefs.getToken().then(
      (value) {
        token = value;
      },
    );

    options.headers['Authorization'] =
        'Bearer 112|9o3L78AJhxHZII4pEolfCCqxDoxfuI7YeFfiQ5xI';

    handler.next(options);
    print('token: $token');
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    print(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    print(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    handler.next(err);
  }
}
