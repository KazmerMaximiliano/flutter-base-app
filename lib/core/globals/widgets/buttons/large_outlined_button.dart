import 'package:flutter/material.dart';
import 'package:flutterbaseapp/core/globals/colors/smartzone_colors.dart';
import 'package:flutterbaseapp/core/globals/styles/styles.dart';

class LargeOutlinedButton extends StatelessWidget {
  const LargeOutlinedButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.borderColor,
    this.borderWidth,
    this.bgColor,
    this.habilitado = true,
    this.padding,
  }) : super(key: key);

  final String title;
  final void Function() onPressed;
  final Color? borderColor;
  final double? borderWidth;
  final Color? bgColor;
  final EdgeInsets? padding;
  final bool habilitado;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(vertical: 16.0, horizontal: 0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: bgColor ?? Colors.transparent,
          border: Border.all(
            color: habilitado ? borderColor ?? SzColors.pasteles.red : SzColors.greys.silver,
            width: borderWidth ?? 0.5,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: TextButton(
          style: Styles.buttons.outlined,
          onPressed: onPressed,
          child: Text(
            title.toUpperCase(),
            style: habilitado ? Styles.texts.inButtons.base(color: SzColors.pasteles.red) : Styles.texts.inButtons.largeOutlinedInhab,
          ),
        ),
      ),
    );
  }
}
