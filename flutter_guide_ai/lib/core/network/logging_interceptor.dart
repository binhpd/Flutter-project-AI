import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class LoggingInterceptor extends Interceptor {
  final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      errorMethodCount: 5,
      lineLength: 50,
      colors: true,
      printEmojis: true,
      printTime: true,
    ),
  );

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _logger.i('REQUEST[${options.method}] => PATH: ${options.path}');
    _logger.i('Headers: ${_formatHeaders(options.headers)}');
    _logger.i('Data: ${_formatData(options.data)}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _logger.i(
      'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
    );
    _logger.i('Data: ${_formatData(response.data)}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    _logger.e(
      'ERROR[${err.response?.statusCode ?? 'No Status Code'}] => PATH: ${err.requestOptions.path}',
    );
    _logger.e('Message: ${err.message ?? 'No Error Message'}');
    _logger.e('Data: ${_formatData(err.response?.data)}');
    super.onError(err, handler);
  }

  String _formatHeaders(Map<String, dynamic>? headers) {
    if (headers == null) return 'No Headers';
    try {
      return headers.toString();
    } catch (e) {
      return 'Error formatting headers: $e';
    }
  }

  String _formatData(dynamic data) {
    if (data == null) return 'No Data';
    try {
      if (data is Map || data is List) {
        return data.toString();
      }
      return data.toString();
    } catch (e) {
      return 'Error formatting data: $e';
    }
  }
} 