import 'package:dartz/dartz.dart';
import 'package:flutterbaseapp/core/http/custom_error.dart';
import 'package:flutterbaseapp/core/http/server_exception.dart';
import 'package:flutterbaseapp/features/data/datasources/remote/api/user_remote_datasource.dart';
import 'package:flutterbaseapp/features/data/models/user_model.dart';
import 'package:flutterbaseapp/features/domain/presenters/user_presenter.dart';

class UserRepository implements IUserPresenter {
  final UserRemoteDataSource _remoteDataSource;

  UserRepository({
    required UserRemoteDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;

  @override
  Future<Either<CustomError, UserModel>> getUser() async {
    try {
      final res = await _remoteDataSource.getUser();

      return Right(res);
    } on ServerException {
      return Left(ServerError());
    } catch (_) {
      return Left(ServerError());
    }
  }
}
