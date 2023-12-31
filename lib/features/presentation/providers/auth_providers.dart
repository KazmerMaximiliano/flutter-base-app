import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutterbaseapp/features/domain/services/shared_preferences.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_providers.g.dart';

@riverpod
class AuthUserName extends _$AuthUserName {
  @override
  String? build() {
    return null;
  }

  void changeUserName(String? userName) {
    state = userName;
  }

  String? isValidUserName() {
    if (state == null || state!.isEmpty) {
      return 'Por favor ingresa tu nombre de usuario';
    }

    return null;
  }
}

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

    RegExp hasLowercase = RegExp(r'[a-z]');
    if (!hasLowercase.hasMatch(state ?? '')) {
      return 'La contraseña debe tener al menos una letra minúscula';
    }

    RegExp hasUppercase = RegExp(r'[A-Z]');
    if (!hasUppercase.hasMatch(state ?? '')) {
      return 'La contraseña debe tener al menos una letra mayúscula';
    }

    RegExp hasNumber = RegExp(r'\d');
    if (!hasNumber.hasMatch(state ?? '')) {
      return 'La contraseña debe tener al menos un número';
    }

    RegExp hasSpecialChar = RegExp(r'[\W_]');
    if (!hasSpecialChar.hasMatch(state ?? '')) {
      return 'La contraseña debe tener al menos un caracter especial';
    }

    if (state!.length < 8) {
      return 'La contraseña debe tener al menos 8 caracteres';
    }

    return null;
  }
}

@riverpod
class AuthPasswordConfirmation extends _$AuthPasswordConfirmation {
  @override
  String? build() {
    return null;
  }

  void changePasswordConfirmation(String? passwordConfirmation) {
    state = passwordConfirmation;
  }

  String? isValidPasswordConfirmation() {
    if (state == null || state!.isEmpty) {
      return 'Por favor ingresa tu contraseña';
    }

    if (state != ref.read(authPasswordProvider)) {
      return 'Las contraseñas no coinciden';
    }

    return null;
  }
}

@riverpod
class RegisterForm extends _$RegisterForm {
  @override
  GlobalKey<FormState> build() {
    return GlobalKey<FormState>();
  }
}

@riverpod
bool isValidRegisterForm(IsValidRegisterFormRef ref) {
  return ref.read(authUserNameProvider.notifier).isValidUserName() == null &&
      ref.read(authEmailProvider.notifier).isValidEmail() == null &&
      ref.read(authPasswordProvider.notifier).isValidPassword() == null &&
      ref
              .read(authPasswordConfirmationProvider.notifier)
              .isValidPasswordConfirmation() ==
          null;
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
