import 'package:dio/dio.dart';
class JWTInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    String? token = "asda1ksjmdfuig12";



    if (token == null) {
      // TODO no token found
    } else {
      options.headers.putIfAbsent('Authorization', () => token);
    }
    super.onRequest(options, handler);
  }
}
