import 'package:dartz/dartz.dart';
import 'package:flutterbaseapp/core/http/custom_error.dart';
import 'package:flutterbaseapp/features/domain/entities/user.dart';

abstract class IUserPresenter {
  Future<Either<CustomError, User>> getUser();
}
