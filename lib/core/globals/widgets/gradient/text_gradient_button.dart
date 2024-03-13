import 'package:flutter/material.dart';
import 'package:flutterbaseapp/core/globals/colors/smartzone_colors.dart';
import 'package:flutterbaseapp/core/globals/styles/texts/texts.dart';

class TextGradientButton extends StatelessWidget {
  const TextGradientButton({
    Key? key,
    required this.text,
    required this.size,
    required this.onTap,
    this.colors,
    this.width,
    this.height,
    this.fontSize = 20,
  }) : super(key: key);
  final String text;
  final List<Color>? colors;
  final double size;
  final double? width;
  final double? height;
  final int fontSize;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    final border = BorderRadius.all(Radius.circular(size / 2));
    return InkWell(
      onTap: onTap,
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
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: TextsStyles().fontSizeByWidth(context, fontSize),
            ),
          ),
        ),
      ),
    );
  }
}
