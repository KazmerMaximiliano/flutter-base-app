import 'package:dartz/dartz.dart';
import 'package:flutterbaseapp/core/http/custom_error.dart';
import 'package:flutterbaseapp/features/domain/entities/user.dart';
import 'package:flutterbaseapp/features/domain/presenters/user_presenter.dart';

class GetUserUseCase {
  GetUserUseCase({
    required IUserPresenter repository,
  }) : _repository = repository;

  final IUserPresenter _repository;

  Future<Either<CustomError, User>> call() async => await _repository.getUser();
}
