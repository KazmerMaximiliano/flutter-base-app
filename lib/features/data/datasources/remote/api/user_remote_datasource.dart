import 'package:dio/dio.dart';
import 'package:flutterbaseapp/features/data/datasources/remote/api_client.dart';
import 'package:flutterbaseapp/features/data/models/user_model.dart';

class UserRemoteDataSource extends ApiClient {
  UserRemoteDataSource({required securityDao})
      : super(securityDao: securityDao);

  Future<UserModel> getUser() async {
    Response response = await dio.get(
      '/user',
    );

    final user = UserModel.fromJson(response.data['data']);

    return user;
  }
}
