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
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async =>
      await _repository.register(
        name: name,
        email: email,
        password: password,
        passwordConfirmation: passwordConfirmation,
      );
}
