import 'package:dartz/dartz.dart';
import 'package:flutterbaseapp/core/http/custom_error.dart';
import 'package:flutterbaseapp/features/domain/entities/auth.dart';
import 'package:flutterbaseapp/features/domain/presenters/auth_presenter.dart';

class RegisterUseCase {
  RegisterUseCase({
    required IAuthPresenter repository,
  }) : _repository = repository;

  final IAuthPresenter _repository;

  Future<Either<CustomError, Auth>> call({
    required String email,
    required String password,
  }) async =>
      await _repository.register(
        email: email,
        password: password,
      );
}
