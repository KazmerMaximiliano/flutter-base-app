import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterbaseapp/core/globals/globals.dart';
import 'package:flutterbaseapp/core/globals/widgets/smartzone_icons.dart';

/// Elige el tipo de icono que se va a posicionar en el leading del AppBar.
enum AppBarLeadingIcon { back, none }

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title = "",
    this.trailingIcons = const <Widget>[],
    this.leadingIcon = AppBarLeadingIcon.none,
    this.onBack,
    this.scaffoldKey,
    this.iconColors,
    this.elevated = true,
    this.transparent = false,
    this.centerTitle = false,
    this.dark = false,
    this.titleTextStyle,
    this.bottom,
    this.appBarHeight = 56,
    this.closeAppIfCantPop = false,
  });
  final String title;
  final List<Widget>? trailingIcons;
  final AppBarLeadingIcon leadingIcon;

  final void Function()? onBack;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final Color? iconColors;
  final bool elevated;
  final bool transparent;
  final bool centerTitle;
  final bool dark;
  final TextStyle? titleTextStyle;
  final PreferredSizeWidget? bottom;
  final double appBarHeight;
  final bool closeAppIfCantPop;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: _getLeadingIcon(),
      leadingWidth: leadingIcon != AppBarLeadingIcon.none ? 56 : 10,
      actions: trailingIcons,
      centerTitle: centerTitle,
      elevation: elevated ? 0.25 : 0,
      backgroundColor: transparent
          ? Colors.transparent
          : dark
              ? SzColors.greys.black
              : null,
      title: Text(
        title,
        style: titleTextStyle ?? Styles.texts.appBarTextStyle(dark: dark),
        overflow: TextOverflow.fade,
        textAlign: TextAlign.left,
      ),
      bottom: bottom,
    );
  }

  Widget _getLeadingIcon() {
    Widget leading;
    switch (leadingIcon) {
      case AppBarLeadingIcon.none:
        const none = SizedBox();
        leading = none;
        break;
      case AppBarLeadingIcon.back:
        final backButton = Builder(
          builder: (context) {
            return IconButton(
              icon: SzIcon(
                SzIcons.back,
                size: 30,
                color: iconColors ?? SzColors.greys.grey57,
              ),
              onPressed: onBack.runtimeType != Null
                  ? onBack
                  : () {
                      if (Navigator.of(context).canPop()) {
                        Navigator.pop(context);
                      } else {
                        if (closeAppIfCantPop) {
                          () => confirmAlertDialog(
                                context,
                                "¿Desea cerrar Smartzone?",
                                () => SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
                              );
                        }
                      }
                    },
            );
          },
        );
        leading = backButton;
        break;

      default:
        leading = const SizedBox();
        break;
    }
    final visibleLeading = Visibility(
      visible: leadingIcon != AppBarLeadingIcon.none,
      child: leading,
    );
    return visibleLeading;
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);
}
