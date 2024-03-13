import 'package:flutter/material.dart';
import 'package:flutterbaseapp/core/globals/colors/smartzone_colors.dart';
import 'package:flutterbaseapp/core/globals/theme/custom_theme.dart';

class TextsStyles {
  double fontSizeByWidth(context, int percent) {
    Size screenSize = MediaQuery.of(context).size;
    return (((screenSize.width / 5) / 100) * percent);
  }

  TextStyle appBarTextStyle({bool dark = false}) => TextStyle(
        fontSize: 19,
        fontWeight: FontWeight.bold,
        color: dark ? SzColors.pasteles.white : SzColors.greys.black,
      );

  TextStyle get title => TextStyle(
        color: SzColors.greys.titles,
        fontWeight: FontWeight.w600,
        fontSize: 15,
      );

  TextStyle get profileListTile => TextStyle(
        color: SzColors.greys.grey57,
        fontWeight: FontWeight.w600,
        fontSize: 15,
      );

  TextStyle get emptys => TextStyle(
        color: SzColors.greys.titles,
        fontWeight: FontWeight.w500,
        fontSize: 15,
      );

  TextStyle get semiboldedTitle => TextStyle(
        color: SzColors.greys.titles,
        fontWeight: FontWeight.w600,
        fontSize: 15,
      );

  TextStyle get boldedTitle => TextStyle(
        color: SzColors.greys.titles,
        fontWeight: FontWeight.bold,
        fontSize: 15,
      );

  TextStyle get bold => const TextStyle(fontWeight: FontWeight.bold);

  TextStyle get boldTitle => const TextStyle(fontWeight: FontWeight.bold, fontSize: 30);

  TextStyle get withPrimaryColor => TextStyle(color: CustomTheme.theme.primaryColor);

  TextStyle get whiteFont => const TextStyle(color: Colors.white);

  TextStyle get mini => TextStyle(fontSize: 14, color: SzColors.greys.grey86);
  TextStyle get miniPrimary => TextStyle(fontSize: 14, color: CustomTheme.theme.primaryColor);
  TextStyle get emptysMessages => const TextStyle(fontSize: 20);

  _InLoginStyles inLogin = _InLoginStyles();
  _Buttons inButtons = _Buttons();
}

class _InLoginStyles {
  static const double _fontSize = 15.0;

  final TextStyle normal = const TextStyle(
    fontWeight: FontWeight.w500,
    color: Colors.white,
    fontSize: _fontSize - 1.1,
  );

  final TextStyle button = TextStyle(
    color: SzColors.greys.greyF5,
    fontSize: 17,
    fontWeight: FontWeight.bold,
  );

  final TextStyle title = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 19,
    color: Colors.white,
  );

  final TextStyle mini = const TextStyle(
    fontWeight: FontWeight.w600,
    color: Colors.white,
    fontSize: _fontSize - 1,
  );

  final TextStyle links = const TextStyle(
    fontSize: _fontSize - 1.5,
    color: Colors.white,
    decoration: TextDecoration.underline,
    fontWeight: FontWeight.bold,
  );

  final TextStyle input = TextStyle(
    fontWeight: FontWeight.w400,
    color: SzColors.greys.grey86,
    fontSize: 18,
  );

  final TextStyle hint = TextStyle(
    fontWeight: FontWeight.w400,
    color: SzColors.greys.greyc2,
    fontSize: 18,
  );
}

class _Buttons {
  TextStyle base({Color? color, FontWeight? fontWeight, double? fontSize}) {
    return TextStyle(
      color: color ?? SzColors.greys.grey49,
      fontWeight: fontWeight ?? FontWeight.bold,
      fontSize: fontSize ?? 16,
    );
  }

  TextStyle get largeOutlined => base();

  TextStyle get largeOutlinedInhab => base(color: SzColors.greys.silver);

  TextStyle get button => base(fontSize: 18, color: SzColors.greys.grey49);
  TextStyle get elevatedButton => base();
  final TextStyle textButton = TextStyle(fontSize: 16, color: CustomTheme.theme.primaryColor);
  final TextStyle checkboxButton = const TextStyle(fontSize: 16, color: Colors.black);
}
