import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Nav {
  static Route getNativePageRoute(Widget route) {
    return Platform.isAndroid
        ? MaterialPageRoute(builder: (_) => route)
        : CupertinoPageRoute(builder: (_) => route);
  }

  static Future<dynamic> pushToWidget(BuildContext context, Widget route) async {
    await Navigator.of(context).push(getNativePageRoute(route));
  }

  static Future<dynamic> pushToNamed(BuildContext context, String route) async {
    await Navigator.of(context).pushNamed(route);
  }

  /// PRECAUCION : USAR SOLO EN CASOS DE PASAR DE PERMISOS AL MENU
  static Future<dynamic> pushRepNamed(BuildContext context, String route) async {
    await Navigator.of(context).pushReplacementNamed(route);
  }

  /// PRECAUCION : USAR SOLO EN CASOS DE PASAR DE PERMISOS AL MENU
  static Future<dynamic> pushRepWidget(BuildContext context, Widget route) async {
    await Navigator.of(context).pushReplacement(getNativePageRoute(route));
  }

  static Future<dynamic> pop(BuildContext context, [dynamic data]) async {
    if (Navigator.canPop(context)) Navigator.pop(context, data);
  }
}
