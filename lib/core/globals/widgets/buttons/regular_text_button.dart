import 'package:flutter/material.dart';

class RegularTextButton extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  final EdgeInsets padding;
  final EdgeInsets innerPadding;
  final TextStyle? textStyle;

  const RegularTextButton({
    Key? key,
    required this.onPressed,
    required this.title,
    this.padding = const EdgeInsets.all(8.0),
    this.innerPadding = const EdgeInsets.all(8.0),
    this.textStyle,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.resolveWith((states) => innerPadding),
          shape: MaterialStateProperty.resolveWith(
            (states) => RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24.0),
            ),
          ),
        ),
        child: Text(
          title,
          style: textStyle ??
              TextStyle(
                color: onPressed != null ? Colors.orange : Colors.grey,
              ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
