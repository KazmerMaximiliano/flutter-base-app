import 'package:flutterbaseapp/features/data/datasources/local/security_dao.dart';
import 'package:flutterbaseapp/features/data/datasources/remote/api/auth_remote_datasource.dart';
import 'package:flutterbaseapp/features/data/datasources/remote/api/user_remote_datasource.dart';
import 'package:flutterbaseapp/features/data/repositories/auth_repository.dart';
import 'package:flutterbaseapp/features/data/repositories/user_repository.dart';
import 'package:flutterbaseapp/features/domain/presenters/auth_presenter.dart';
import 'package:flutterbaseapp/features/domain/presenters/user_presenter.dart';
import 'package:flutterbaseapp/features/domain/usecases/auth/is_authenticated_use_case.dart';
import 'package:flutterbaseapp/features/domain/usecases/auth/register_use_case.dart';
import 'package:flutterbaseapp/features/domain/usecases/auth/signin_use_case.dart';
import 'package:flutterbaseapp/features/domain/usecases/auth/singout_use_case.dart';
import 'package:flutterbaseapp/features/domain/usecases/user/get_user_use_case.dart';
import 'package:get_it/get_it.dart';

GetIt serviceLocator = GetIt.instance;

void setupServiceLocator() {
  // Data sources
  serviceLocator.registerSingleton<SecurityDao>(SecurityDao());

  serviceLocator.registerLazySingleton<AuthRemoteDatasource>(
    () => AuthRemoteDatasource(),
  );

  serviceLocator.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSource(
      securityDao: serviceLocator.get<SecurityDao>(),
    ),
  );

  // Repositories
  serviceLocator.registerLazySingleton<IAuthPresenter>(
    () => AuthRepository(
      remoteDataSource: serviceLocator.get<AuthRemoteDatasource>(),
    ),
  );

  serviceLocator.registerLazySingleton<IUserPresenter>(
    () => UserRepository(
      remoteDataSource: serviceLocator.get<UserRemoteDataSource>(),
    ),
  );

  // Use Cases
  serviceLocator.registerLazySingleton<IsAuthenticatedUseCase>(
    () => IsAuthenticatedUseCase(
      repository: serviceLocator.get<IAuthPresenter>(),
    ),
  );

  serviceLocator.registerLazySingleton<RegisterUseCase>(
    () => RegisterUseCase(
      repository: serviceLocator.get<IAuthPresenter>(),
    ),
  );

  serviceLocator.registerLazySingleton<SignInUseCase>(
    () => SignInUseCase(
      repository: serviceLocator.get<IAuthPresenter>(),
    ),
  );

  serviceLocator.registerLazySingleton<SignOutUseCase>(
    () => SignOutUseCase(
      repository: serviceLocator.get<IAuthPresenter>(),
    ),
  );

  serviceLocator.registerLazySingleton<GetUserUseCase>(
    () => GetUserUseCase(
      repository: serviceLocator.get<IUserPresenter>(),
    ),
  );
}
