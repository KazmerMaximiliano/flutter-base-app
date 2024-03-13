import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterbaseapp/core/globals/globals.dart';
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

    final email = ref.watch(authEmailProvider);
    final password = ref.watch(authPasswordProvider);

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 32, 16, 0),
      child: Form(
        key: registerFormKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SmartzoneTextField(
              title: "MI CORREO ES",
              hint: "Ej: micorreo@mail.com",
              onChanged: ref.read(authEmailProvider.notifier).changeEmail,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                return ref.read(authEmailProvider.notifier).isValidEmail();
              },
            ),
            const SizedBox(height: 16),
            SmartzoneTextField(
              title: "MI CONTRASEÑA ES",
              obscure: true,
              keyboardType: TextInputType.visiblePassword,
              hint: "Contraseña",
              onChanged: ref.read(authPasswordProvider.notifier).changePassword,
              validator: (value) {
                return ref.read(authPasswordProvider.notifier).isValidPassword();
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: LargeButton(
                title: "Registrarse",
                onPressed: ref.read(isValidRegisterFormProvider)
                    ? () async {
                        await register(
                          email: email,
                          password: password,
                          context: context,
                          ref: ref,
                        );
                      }
                    : null,
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
  required String? email,
  required String? password,
  required BuildContext context,
  required WidgetRef ref,
}) async {
  final prefs = SharedPrefs();
  final registerUseCase = GetIt.I<RegisterUseCase>();
  final signInUseCase = GetIt.I<SignInUseCase>();

  String? message;

  final register = await registerUseCase(
    email: email ?? '',
    password: password ?? '',
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
