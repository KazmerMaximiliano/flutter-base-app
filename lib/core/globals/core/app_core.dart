import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterbaseapp/core/globals/colors/smartzone_colors.dart';
import 'package:flutterbaseapp/core/globals/navigate_service.dart';
import 'package:flutterbaseapp/core/globals/theme/custom_theme.dart';
import 'package:flutterbaseapp/core/globals/widgets/custom_app_bar.dart';
import 'package:flutterbaseapp/core/globals/widgets/dialogs/confirm_alert_dialog.dart';

/// clase para acceder a metodos o variables globales / generales de la app.
class AppCore {
  static String get title => 'Smartzone';

  static ThemeData get theme => CustomTheme.theme;

  static const String flutterbaseappVersion = "2.2.0";

  /// Crea un AppBar con posibilidad de elegir un titulo String, asi tambien como los iconos del leading y trailing.
  ///
  /// Si no se desea usar el logo, establecer un texto [String] con [title] y [false] a [withLogo].
  ///
  /// Si [leadingIcon] es [AppBarLeadingIcon.back], se puede personalizar la funcion de back con el parametro onBack, sino, por defecto ejecutara [Navigator.pop(context)] en caso de poder hacer pop.
  static PreferredSizeWidget appBar({
    String title = "",
    List<Widget> trailingIcons = const <Widget>[],
    AppBarLeadingIcon leadingIcon = AppBarLeadingIcon.none,
    void Function()? onBack,
    bool centerTitle = false,
    final GlobalKey<ScaffoldState>? scaffoldKey,
    bool dark = false,
    bool elevated = true,
    bool transparent = false,
    Color? iconColors,
    double appBarHeight = 60,
    TextStyle? titleTextStyle,
    PreferredSizeWidget? bottom,
  }) {
    return CustomAppBar(
      appBarHeight: appBarHeight,
      title: title,
      trailingIcons: trailingIcons,
      leadingIcon: leadingIcon,
      onBack: onBack,
      scaffoldKey: scaffoldKey,
      elevated: elevated,
      centerTitle: centerTitle,
      dark: dark,
      transparent: transparent,
      iconColors: iconColors,
      titleTextStyle: titleTextStyle,
      bottom: bottom,
    );
  }

  static PreferredSizeWidget backAppBar({bool closeApp = false, Color? iconColors}) {
    return CustomAppBar(
      title: "",
      leadingIcon: AppBarLeadingIcon.back,
      closeAppIfCantPop: closeApp,
      iconColors: iconColors ?? SzColors.greys.black,
    );
  }

  static PreferredSizeWidget transparentBackAppBar({
    String title = "",
    Color iconColors = Colors.black,
    List<Widget>? trailing,
    void Function()? onBack,
  }) {
    return CustomAppBar(
      elevated: false,
      transparent: true,
      title: title,
      leadingIcon: AppBarLeadingIcon.back,
      onBack: onBack,
      trailingIcons: trailing,
      iconColors: iconColors,
    );
  }

  static Widget cuentaAppBar({
    Color iconColors = Colors.black,
    void Function()? onReady,
    void Function()? onCancel,
  }) {
    return Builder(
      builder: (_) => AppBar(
        title: Text(
          "Sobre mí",
          style: TextStyle(
            color: SzColors.greys.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: TextButton(
          onPressed: onCancel ?? () => Nav.pop(_),
          child: Text(
            "Cancelar",
            style: TextStyle(color: iconColors),
          ),
        ),
        leadingWidth: 100,
        centerTitle: true,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: onReady,
            child: Text(
              "Listo",
              style: TextStyle(
                color: SzColors.pasteles.red,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void closeApp(BuildContext context) {
    confirmAlertDialog(
      context,
      "¿Desea cerrar Smartzone?",
      () => SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
    );
  }
}
