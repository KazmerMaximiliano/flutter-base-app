import 'package:flutter/material.dart';
import 'package:flutterbaseapp/core/globals/colors/smartzone_colors.dart';

class CustomTheme {
  static ThemeData get theme {
    return ThemeData(
      appBarTheme: appBarTheme,
      primarySwatch: SzColors.primarySwatch,
      fontFamily: "OpenSans",
      scaffoldBackgroundColor: Colors.white,
      drawerTheme: DrawerThemeData(
        backgroundColor: Colors.white,
        scrimColor: Colors.white.withOpacity(0.5),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }

  static AppBarTheme get appBarTheme {
    return const AppBarTheme(
      color: Colors.white,
      toolbarTextStyle: TextStyle(
        color: SzColors.appBarTitle,
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
    );
  }
}
