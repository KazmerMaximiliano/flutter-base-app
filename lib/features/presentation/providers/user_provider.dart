import 'package:flutterbaseapp/features/data/models/user_model.dart';
import 'package:flutterbaseapp/features/domain/entities/user.dart';
import 'package:flutterbaseapp/features/domain/usecases/user/get_user_use_case.dart';
import 'package:get_it/get_it.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_provider.g.dart';

@riverpod
Future<User> user(UserRef ref) async {
  final getUserUseCase = GetIt.I<GetUserUseCase>();

  final user = await getUserUseCase();

  return user.getOrElse(() => UserModel.empty());
}
