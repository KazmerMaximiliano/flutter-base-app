import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterbaseapp/features/data/models/auth_model.dart';
import 'package:flutterbaseapp/features/domain/services/shared_preferences.dart';
import 'package:flutterbaseapp/features/domain/usecases/auth/signin_use_case.dart';
import 'package:flutterbaseapp/features/presentation/providers/auth_providers.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginFormKey = ref.watch(loginFormProvider);

    final email = ref.watch(authEmailProvider);
    final password = ref.watch(authPasswordProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Form(
        key: loginFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Iniciar Sesión',
                style: Theme.of(context).textTheme.titleLarge,
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
              child: ElevatedButton(
                onPressed: ref.read(isValidLoginFormProvider)
                    ? () async {
                        await signIn(
                          email: email,
                          password: password,
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
                child: const Text('Iniciar Sesión'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: Text(
                '¿No tienes cuenta?',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            TextButton(
              onPressed: () {
                context.go('/register');
              },
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(
                  const Size(double.infinity, 42),
                ),
              ),
              child: const Text('Registrarse'),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> signIn({
  required String? email,
  required String? password,
  required BuildContext context,
  required WidgetRef ref,
}) async {
  final prefs = SharedPrefs();
  final signInUseCase = GetIt.I<SignInUseCase>();

  final signIn = await signInUseCase(
    email: email ?? '',
    password: password ?? '',
  );

  if (signIn.isRight()) {
    signIn.getOrElse(() => AuthModel.empty());

    prefs.logged = true;
    ref.read(isAuthenticatedProvider.notifier).setIsAuthenticated(true);

    if (!context.mounted) return;
    context.go('/home');
  } else if (signIn.isLeft()) {
    SnackBar snackBar = const SnackBar(
      content: Text(
        "Usuario o contraseña incorrectos",
        style: TextStyle(
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
