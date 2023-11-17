import 'package:dio/dio.dart';
import 'package:flutterbaseapp/core/config/enviroment_config.dart';
import 'package:flutterbaseapp/features/data/datasources/local/security_dao.dart';
import 'package:flutterbaseapp/features/domain/services/shared_preferences.dart';

class ApiClient {
  final SecurityDao _securityDao;
  String? _accessToken;

  late Dio dio;

  ApiClient({required securityDao}) : _securityDao = securityDao {
    BaseOptions options = BaseOptions(
      baseUrl: EnvironmentConfig.apiUrl ?? '',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Accept': 'application/json',
      },
    );

    dio = Dio(options);

    dio.interceptors.clear();

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          _accessToken = await _securityDao.getAccessToken();

          if (_accessToken != null) {
            options.headers["Authorization"] = "Bearer $_accessToken";
          }

          return handler.next(options);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          return handler.next(response);
        },
        onError: (DioException e, ErrorInterceptorHandler handler) async {
          print(e);
          if (e.response?.statusCode == 401) {
            print('ERROR 401');
            // TODO: RESET PROVIDER
            final prefs = SharedPrefs();
            prefs.logged = false;
          }

          return handler.next(e);
        },
      ),
    );
  }
}
