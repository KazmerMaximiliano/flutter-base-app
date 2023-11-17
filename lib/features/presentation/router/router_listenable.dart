import 'package:flutter/material.dart';
import 'package:flutterbaseapp/features/presentation/providers/auth_providers.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'routes.dart';

part 'router_listenable.g.dart';

@riverpod
class RouterListenable extends _$RouterListenable implements Listenable {
  VoidCallback? _routerListener;
  bool _isAuthenticated = false;

  @override
  Future<void> build() async {
    _isAuthenticated = await ref.watch(isAuthenticatedProvider);

    ref.listenSelf((_, __) {
      if (state.isLoading) return;
      _routerListener?.call();
    });
  }

  String? redirect(BuildContext context, GoRouterState state) {
    if (this.state.isLoading || this.state.hasError) return null;
    final isSplash = state.uri.toString() == SplashRoute.path;

    if (isSplash) {
      return _isAuthenticated ? UserRoute.path : LoginRoute.path;
    }

    final isLoggingIn = state.uri.toString() == LoginRoute.path;
    if (isLoggingIn) return _isAuthenticated ? UserRoute.path : null;

    final isReggistering = state.uri.toString() == RegisterRoute.path;
    if (isReggistering) return _isAuthenticated ? UserRoute.path : null;

    return _isAuthenticated ? null : SplashRoute.path;
  }

  @override
  void addListener(VoidCallback listener) {
    _routerListener = listener;
  }

  @override
  void removeListener(VoidCallback listener) {
    _routerListener = null;
  }
}
