import 'package:dartz/dartz.dart';
import 'package:flutterbaseapp/core/http/custom_error.dart';
import 'package:flutterbaseapp/core/http/server_exception.dart';
import 'package:flutterbaseapp/features/data/datasources/remote/api/auth_remote_datasource.dart';
import 'package:flutterbaseapp/features/domain/entities/auth.dart';
import 'package:flutterbaseapp/features/domain/presenters/auth_presenter.dart';

class AuthRepository implements IAuthPresenter {
  final AuthRemoteDatasource _remoteDataSource;

  AuthRepository({
    required AuthRemoteDatasource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;

  @override
  Future<Either<CustomError, Auth>> register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    try {
      final auth = await _remoteDataSource.register(
        name: name,
        email: email,
        password: password,
        passwordConfirmation: passwordConfirmation,
      );

      return Right(auth);
    } on ServerException {
      return Left(ServerError());
    } catch (_) {
      return Left(ServerError());
    }
  }

  @override
  Future<Either<CustomError, Auth>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final auth = await _remoteDataSource.signIn(
        email: email,
        password: password,
      );

      return Right(auth);
    } on ServerException {
      return Left(ServerError());
    } catch (_) {
      return Left(ServerError());
    }
  }

  @override
  Future<Either<CustomError, bool>> isAuthenticated() async {
    try {
      final res = await _remoteDataSource.isAuthenticated();
      if (res) {
        return Right(res);
      }

      return Left(ServerError());
    } on ServerException {
      return Left(ServerError());
    } catch (_) {
      return Left(ServerError());
    }
  }

  @override
  Future<Either<CustomError, bool>> signOut() async {
    try {
      final res = await _remoteDataSource.signOut();
      return Right(res);
    } on ServerException {
      return Left(ServerError());
    } catch (_) {
      return Left(ServerError());
    }
  }
}
