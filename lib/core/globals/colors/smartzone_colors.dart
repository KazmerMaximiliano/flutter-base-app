import 'package:flutter/material.dart';

class SzColors {
  /// Paleta de colores pasteles
  static _PastelPallette get pasteles => _PastelPallette();

  /// Paleta de grises
  static _GreysPallette get greys => _GreysPallette();

  /// Paleta para usar dentro de la pantalla de Chat
  static _InChatPallette get inChat => _InChatPallette();

  /// Paleta para usar dentro de los pop ups
  static _InPopUpPallette get popUps => _InPopUpPallette();

  //usos
  static const Color primary = Color(0xFFFF4D67);
  static const Color inactive = Color(0xFF575756);
  static const Color secondary = Color(0xFFFA944B);
  static const Color alternative = Color(0xFFFFCC00);

  static const List<Color> degrade = [Color(0xFFFF4D67), Color(0xFFFA944B)];
  static List<Color> degradeAlternativo = [primary, secondary];
  static List<Color> degradeBlackTransp = [
    SzColors.greys.black.withOpacity(0.5),
    Colors.transparent
  ];
  static List<Color> degradeWhiteToTransp = [Colors.white, Colors.transparent];

  static const mbsWhite = Color(0xffF5F5F5);
  static const notifNoVista = Color(0xffFFF3F5);
  static const cascaraDeHuevo = Color(0xfff1ead6);
  static const algodon = Color(0xffF4F4F4);
  static const appBarTitle = Color(0xff575758);

  static MaterialColor primarySwatch = MaterialColor(primary.value, colors);

  static Map<int, Color> colors = {
    50: primary.withOpacity(0.1),
    100: primary.withOpacity(0.2),
    200: primary.withOpacity(0.3),
    300: primary.withOpacity(0.4),
    400: primary.withOpacity(0.5),
    500: primary.withOpacity(0.6),
    600: primary.withOpacity(0.7),
    700: primary.withOpacity(0.8),
    800: primary.withOpacity(0.9),
    900: primary,
  };
}

class _PastelPallette {
  Color orange = const Color(0xFFFA944B);
  Color red = const Color(0xFFFF4D67);
  Color grey = const Color(0xFFF5F5F5);
  Color white = const Color(0xFFFFFFFF);
  Color violet = const Color(0xFF6D4488);
  Color rose = const Color(0xFFFF59AC);
  Color amber = const Color(0xFFFFDE59);
  Color green = const Color(0xFF52CC8F);
  Color blue = const Color(0xFF4D7FFF);
  Color redAccent = const Color(0xFFff1d3f);
}

class _GreysPallette {
  Color black = const Color(0xFF1f1f1e);
  Color grey = const Color(0xFF575758);
  Color grey49 = const Color(0xFF494949);
  Color titles = const Color(0xFF1F1F1E);
  Color grey86 = const Color(0xFF868683);
  Color silver = const Color(0xFFc2c2c1);
  Color whiteGrey = const Color(0xFFefefef);
  Color greyF5 = const Color(0xFFF5F5F5);
  Color greyc2 = const Color(0xFFc2c2c1);
  Color grey57 = const Color(0xFF575758);
  Color whitePressed = const Color(0xFFFFD3DA);
  Color pressed = const Color.fromARGB(255, 238, 238, 238);
}

class _InChatPallette {
  Color senderBg = const Color(0xFF7e5996);
  Color senderMsg = const Color(0xFFffffff);
  Color receiverBg = const Color(0xFF1f1f1e);
  Color receiverMsg = const Color(0xFF000000);
  Color textFieldBg = const Color(0xFFf5f5f5);
  Color textFieldMsg = const Color(0xFFc2c2c1);
  Color purple = const Color(0xFF6D4488);
  Color send = SzColors.pasteles.red;
  List<Color> degradeSender = const [Color(0xFF6D4488), Color(0xEE6D4488)];
}

class _InPopUpPallette {
  Color buttonsBlack = const Color(0xFF424040);
}
