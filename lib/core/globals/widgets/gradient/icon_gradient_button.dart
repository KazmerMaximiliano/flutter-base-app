import 'package:flutter/material.dart';
import 'package:flutterbaseapp/core/globals/colors/smartzone_colors.dart';

class IconGradientButton extends StatelessWidget {
  const IconGradientButton({
    Key? key,
    required this.iconData,
    this.colors,
    required this.size,
    required this.onTap,
    this.width,
    this.height,
  }) : super(key: key);
  final IconData iconData;
  final List<Color>? colors;
  final double size;
  final double? width;
  final double? height;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    final border = BorderRadius.all(Radius.circular(size / 2));
    return InkWell(
      borderRadius: border,
      child: Container(
        width: width ?? size,
        height: height ?? size,
        decoration: BoxDecoration(
          borderRadius: border,
          gradient: LinearGradient(
            colors: colors ??
                [
                  SzColors.pasteles.red,
                  SzColors.pasteles.orange,
                ],
          ),
        ),
        child: Icon(iconData, color: Colors.white, size: size / 3 * 2),
      ),
      onTap: onTap,
    );
  }
}
