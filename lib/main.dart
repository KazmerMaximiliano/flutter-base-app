import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterbaseapp/core/config/enviroment_config.dart';
import 'package:flutterbaseapp/features/domain/services/shared_preferences.dart';
import 'package:flutterbaseapp/features/presentation/router/router_listenable.dart';
import 'package:flutterbaseapp/features/presentation/router/routes.dart';
import 'package:go_router/go_router.dart';

import 'injection_container.dart';

void main() async {
  final prefs = SharedPrefs();

  WidgetsFlutterBinding.ensureInitialized();
  EnvironmentConfig.initEnvironment();
  setupServiceLocator();

  await prefs.initPrefs();
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routerNotifier = ref.watch(routerListenableProvider.notifier);

    return MaterialApp.router(
      routerConfig: GoRouter(
        refreshListenable: routerNotifier,
        initialLocation: SplashRoute.path,
        debugLogDiagnostics: true,
        routes: $appRoutes,
        redirect: routerNotifier.redirect,
      ),
      title: 'Fivvy Budget',
      debugShowCheckedModeBanner: false,
    );
  }
}
