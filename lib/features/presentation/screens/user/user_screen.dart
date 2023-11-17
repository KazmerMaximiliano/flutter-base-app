import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterbaseapp/features/domain/entities/user.dart';
import 'package:flutterbaseapp/features/domain/services/shared_preferences.dart';
import 'package:flutterbaseapp/features/domain/usecases/auth/singout_use_case.dart';
import 'package:flutterbaseapp/features/presentation/providers/auth_providers.dart';
import 'package:flutterbaseapp/features/presentation/providers/user_provider.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class UserScreen extends ConsumerWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<User?> user = ref.watch(userProvider);

    return switch (user) {
      AsyncData(:final value) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Center(
                child: Text(
                  'Bienvenido: ',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Center(
                child: Text(
                  value!.name,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ElevatedButton(
                onPressed: () {
                  singOut(context: context, ref: ref);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Theme.of(context).colorScheme.error,
                  ),
                  minimumSize: MaterialStateProperty.all(
                    Size(MediaQuery.of(context).size.width * 0.8, 42),
                  ),
                ),
                child: const Text('Cerrar sesión'),
              ),
            ),
          ],
        ),
      AsyncError() => const Center(child: Text('ERROR!')),
      _ => const Center(child: CircularProgressIndicator()),
    };
  }
}

Future<void> singOut({
  required BuildContext context,
  required WidgetRef ref,
}) async {
  final prefs = SharedPrefs();
  final singOutUseCase = GetIt.I<SignOutUseCase>();

  await singOutUseCase();

  prefs.logged = false;
  ref.read(isAuthenticatedProvider.notifier).setIsAuthenticated(false);

  if (!context.mounted) return;
  context.go('/login');

  return;
}
