import 'package:dio/dio.dart';
import 'package:flutterbaseapp/core/config/enviroment_config.dart';

class AuthClient {
  late Dio dio;

  AuthClient() {
    BaseOptions options = BaseOptions(
      baseUrl: EnvironmentConfig.apiUrl ?? '',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Accept': 'application/json',
      },
    );

    dio = Dio(options);
  }
}
