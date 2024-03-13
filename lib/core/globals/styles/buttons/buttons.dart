import 'package:flutter/material.dart';
import 'package:flutterbaseapp/core/globals/colors/smartzone_colors.dart';

class ButtonsStyles {
  ButtonStyle get largeButton => base(color: SzColors.primary);
  ButtonStyle get inactiveButton => base(color: SzColors.inactive);

  ButtonStyle base({
    Color? color,
    EdgeInsets innerPadding = const EdgeInsets.symmetric(vertical: 12.0),
  }) {
    return ButtonStyle(
      elevation: MaterialStateProperty.resolveWith((states) => 0),
      shape: MaterialStateProperty.resolveWith(
        (states) => RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      overlayColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.pressed)) {
            return SzColors.greys.pressed;
          }
          return null;
        },
      ),
      backgroundColor: MaterialStateProperty.resolveWith(
        (states) {
          return color ?? SzColors.primary;
        },
      ),
      padding: MaterialStateProperty.resolveWith((states) => innerPadding),
      minimumSize: MaterialStateProperty.all(const Size(double.infinity, 48)),
    );
  }

  ButtonStyle get menu {
    return ButtonStyle(
      shape: MaterialStateProperty.resolveWith(
        (states) => RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      overlayColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.pressed)) {
          return SzColors.greys.greyF5;
        }
        return Colors.transparent;
      }),
      padding: MaterialStateProperty.resolveWith((states) => const EdgeInsets.all(0)),
    );
  }

  ButtonStyle get outlined {
    return ButtonStyle(
      padding: MaterialStateProperty.resolveWith(
        (states) => const EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 16.0,
        ),
      ),
      shape: MaterialStateProperty.resolveWith(
        (states) => RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.0),
        ),
      ),
    );
  }
}
