import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutterbaseapp/features/domain/services/shared_preferences.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_providers.g.dart';

@riverpod
class AuthEmail extends _$AuthEmail {
  @override
  String? build() {
    return null;
  }

  void changeEmail(String? email) {
    state = email;
  }

  String? isValidEmail() {
    if (state == null || state!.isEmpty) {
      return 'Por favor ingresa tu correo electrónico';
    }

    if (!EmailValidator.validate(state ?? '')) {
      return 'Por favor ingresa un correo electrónico válido';
    }

    return null;
  }
}

@riverpod
class AuthPassword extends _$AuthPassword {
  @override
  String? build() {
    return null;
  }

  void changePassword(String? password) {
    state = password;
  }

  String? isValidPassword() {
    if (state == null || state!.isEmpty) {
      return 'Por favor ingresa tu contraseña';
    }

    if (state!.length < 8) {
      return 'La contraseña debe tener al menos 8 caracteres';
    }

    return null;
  }
}

@riverpod
class LoginForm extends _$LoginForm {
  @override
  GlobalKey<FormState> build() {
    return GlobalKey<FormState>();
  }
}

@riverpod
bool isValidLoginForm(IsValidLoginFormRef ref) {
  return ref.read(authEmailProvider.notifier).isValidEmail() == null &&
      ref.read(authPasswordProvider.notifier).isValidPassword() == null;
}

@riverpod
class IsAuthenticated extends _$IsAuthenticated {
  @override
  bool build() {
    final prefs = SharedPrefs();
    return prefs.logged;
  }

  void setIsAuthenticated(bool isAuthenticated) {
    state = isAuthenticated;
  }
}
