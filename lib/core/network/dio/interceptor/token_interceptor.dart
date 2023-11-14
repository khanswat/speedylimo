import 'package:dio/dio.dart';

import '../../../../data/data.dart';
import '../../../core.dart';

class TokenInterceptors extends Interceptor {
  var token;

  SharedPrefs _sharedPrefs = SharedPrefs();
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.baseUrl = ApiRoutes.baseUrl;

    await _sharedPrefs.getToken().then(
      (value) {
        token = value;
      },
    );

    options.headers['Authorization'] = 'Bearer $token';

    handler.next(options);
    print('token: $token');
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    handler.next(err);
  }
}
