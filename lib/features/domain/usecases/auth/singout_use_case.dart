import 'package:dartz/dartz.dart';
import 'package:flutterbaseapp/core/http/custom_error.dart';
import 'package:flutterbaseapp/features/domain/presenters/auth_presenter.dart';

class SignOutUseCase {
  SignOutUseCase({
    required IAuthPresenter repository,
  }) : _repository = repository;

  final IAuthPresenter _repository;

  Future<Either<CustomError, bool>> call() async => await _repository.signOut();
}
