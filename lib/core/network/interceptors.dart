import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoggerInterceptor extends Interceptor {
  Logger logger = Logger(
      printer: PrettyPrinter(methodCount: 0, colors: true, printEmojis: true));

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final requestPath = '${options.baseUrl}${options.path}';
    logger.i('${options.method}request => $requestPath'); // Info log
    handler.next(options); // Tiếp tục với request;
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logger.d('STATUSCODE: ${response.statusCode}\n'
        'STATUSMESSAGE: ${response.statusMessage}\n'
        'HEADERS: ${response.headers}\n'
        'DATA:${response.data}'); // Debug log
    handler.next(response); // Tiếp tục với response
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final options = err.requestOptions;
    final requestPath = '${options.baseUrl}${options.path}';
    logger.e('${options.method} request => $requestPath \n'
        'Response Data: ${err.response?.data}'); // Error log
    logger.d('Error type: ${err.type} \n'
        'Error massage: ${err.message}'); // Debug log
    handler.next(err); // Tiếp tục với error
  }
}

class AuthorizationInterceptor extends Interceptor{
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler)  async{
      final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      final token = sharedPreferences.getString('token');
      options.headers['Authorization'] = 'Bearer $token';
      handler.next(options);
  }
}