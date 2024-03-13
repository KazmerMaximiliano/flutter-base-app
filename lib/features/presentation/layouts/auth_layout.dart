import 'package:flutter/material.dart';
import 'package:flutterbaseapp/core/globals/globals.dart';

class AuthLayout extends StatelessWidget {
  final Widget child;
  final String title;

  const AuthLayout({
    Key? key,
    required this.title,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppCore.appBar(title: title, elevated: false, centerTitle: true),
      body: child,
    );
  }
}
