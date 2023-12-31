import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterbaseapp/features/domain/services/shared_preferences.dart';
import 'package:flutterbaseapp/features/domain/usecases/auth/register_use_case.dart';
import 'package:flutterbaseapp/features/domain/usecases/auth/signin_use_case.dart';
import 'package:flutterbaseapp/features/presentation/providers/auth_providers.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends ConsumerWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final registerFormKey = ref.watch(registerFormProvider);

    final username = ref.watch(authUserNameProvider);
    final email = ref.watch(authEmailProvider);
    final password = ref.watch(authPasswordProvider);
    final passwordConfirmation = ref.watch(authPasswordConfirmationProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Form(
        key: registerFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Registrarse',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  label: Text('Username'),
                ),
                onChanged:
                    ref.read(authUserNameProvider.notifier).changeUserName,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  return ref
                      .read(authUserNameProvider.notifier)
                      .isValidUserName();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  label: Text('Email'),
                ),
                onChanged: ref.read(authEmailProvider.notifier).changeEmail,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  return ref.read(authEmailProvider.notifier).isValidEmail();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  label: Text('Password'),
                ),
                obscureText: true,
                onChanged:
                    ref.read(authPasswordProvider.notifier).changePassword,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  return ref
                      .read(authPasswordProvider.notifier)
                      .isValidPassword();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  label: Text('Password Confirmation'),
                ),
                obscureText: true,
                onChanged: ref
                    .read(authPasswordConfirmationProvider.notifier)
                    .changePasswordConfirmation,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  return ref
                      .read(authPasswordConfirmationProvider.notifier)
                      .isValidPasswordConfirmation();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ElevatedButton(
                onPressed: ref.read(isValidRegisterFormProvider)
                    ? () async {
                        await register(
                          username: username,
                          email: email,
                          password: password,
                          passwordConfirmation: passwordConfirmation,
                          context: context,
                          ref: ref,
                        );
                      }
                    : null,
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(
                    const Size(double.infinity, 42),
                  ),
                ),
                child: const Text('Registrarse'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: Text(
                '¿Ya tienes una cuenta?',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            TextButton(
              onPressed: () {
                context.go('/login');
              },
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(
                  const Size(double.infinity, 42),
                ),
              ),
              child: const Text('Iniciar Sesión'),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> register({
  required String? username,
  required String? email,
  required String? password,
  required String? passwordConfirmation,
  required BuildContext context,
  required WidgetRef ref,
}) async {
  final prefs = SharedPrefs();
  final registerUseCase = GetIt.I<RegisterUseCase>();
  final signInUseCase = GetIt.I<SignInUseCase>();

  String? message;

  final register = await registerUseCase(
    name: username ?? '',
    email: email ?? '',
    password: password ?? '',
    passwordConfirmation: passwordConfirmation ?? '',
  );

  if (register.isRight()) {
    final signIn = await signInUseCase(
      email: email ?? '',
      password: password ?? '',
    );

    if (signIn.isRight()) {
      prefs.logged = true;
      ref.read(isAuthenticatedProvider.notifier).setIsAuthenticated(true);

      if (!context.mounted) return;
      context.go('/home');
    } else if (signIn.isLeft()) {
      message = 'Error al iniciar sesión';
    }
  } else if (register.isLeft()) {
    message = 'Error al registrarse';
  }

  if (message != null) {
    SnackBar snackBar = SnackBar(
      content: Text(
        message,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.red,
    );

    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(snackBar);

    prefs.logged = false;
  }

  return;
}
