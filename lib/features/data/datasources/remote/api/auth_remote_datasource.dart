import 'package:dio/dio.dart';
import 'package:flutterbaseapp/features/data/datasources/local/security_dao.dart';
import 'package:flutterbaseapp/features/data/datasources/remote/auth_client.dart';
import 'package:flutterbaseapp/features/data/models/auth_model.dart';
import 'package:flutterbaseapp/features/domain/entities/auth.dart';

class AuthRemoteDatasource extends AuthClient {
  AuthRemoteDatasource();

  final SecurityDao _securityDao = SecurityDao();

  Future<Auth> register({
    required String email,
    required String password,
  }) async {
    Response response = await dio.post(
      '/register',
      data: {
        'email': email,
        'password': password,
      },
    );

    final res = AuthModel.fromJson(response.data);

    await _securityDao.persistAccessToken(res.accessToken);

    return res;
  }

  Future<Auth> signIn({
    required String email,
    required String password,
  }) async {
    Response response = await dio.post(
      '/login',
      data: {
        'email': email,
        'password': password,
      },
    );

    final res = AuthModel.fromJson(response.data);

    await _securityDao.persistAccessToken(res.accessToken);

    return res;
  }

  Future<bool> isAuthenticated() async {
    final hasToken = await _securityDao.hasToken();

    return hasToken;
  }

  Future<bool> signOut() async {
    await dio.post('/logout');
    await _securityDao.clean();
    return true;
  }
}
