import 'package:flutter/material.dart';
import 'package:flutterbaseapp/core/globals/colors/smartzone_colors.dart';

class ElevatedSzButton extends StatelessWidget {
  const ElevatedSzButton({
    Key? key,
    required this.title,
    this.onPressed,
    this.color,
    this.textColor,
    this.borderColor,
    this.withBorder = false,
    this.bold = false,
  }) : super(key: key);
  final String title;
  final void Function()? onPressed;
  final Color? color;
  final Color? textColor;
  final Color? borderColor;
  final bool withBorder;
  final bool bold;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        title,
        style: TextStyle(
          color: textColor ?? Colors.white,
          fontWeight: !bold ? FontWeight.w600 : FontWeight.bold,
          fontSize: 12,
        ),
      ),
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        foregroundColor: SzColors.greys.pressed,
        side: withBorder
            ? BorderSide(
                color: borderColor ?? SzColors.greys.greyc2,
                width: 0.5,
              )
            : null,
        backgroundColor: color ?? Colors.white,
      ),
      onPressed: onPressed,
    );
  }
}
