import 'package:dartz/dartz.dart';
import 'package:flutterbaseapp/core/http/custom_error.dart';
import 'package:flutterbaseapp/features/domain/entities/auth.dart';

abstract class IAuthPresenter {
  Future<Either<CustomError, Auth>> register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
  });

  Future<Either<CustomError, Auth>> signIn({
    required String email,
    required String password,
  });

  Future<Either<CustomError, bool>> isAuthenticated();

  Future<Either<CustomError, bool>> signOut();
}
