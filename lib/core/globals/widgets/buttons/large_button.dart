import 'package:flutter/material.dart';
import 'package:flutterbaseapp/core/globals/colors/smartzone_colors.dart';
import 'package:flutterbaseapp/core/globals/styles/styles.dart';

class LargeButton extends StatelessWidget {
  const LargeButton({
    Key? key,
    this.elevated = true,
    required this.onPressed,
    required this.title,
    this.padding = const EdgeInsets.all(8.0),
    this.bgColor,
    this.textColor,
  }) : super(key: key);
  final bool elevated;
  final String title;
  final void Function()? onPressed;
  final EdgeInsets padding;
  final Color? bgColor;
  final Color? textColor;

  bool get enabled => onPressed != null;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Center(
        child: SizedBox(
          width: double.infinity,
          child: elevated
              ? ElevatedButton(
                  style: enabled ? Styles.buttons.base(color: SzColors.pasteles.red) : Styles.buttons.base(color: SzColors.greys.greyF5),
                  onPressed: onPressed,
                  child: Text(
                    title,
                    style: enabled
                        ? Styles.texts.inButtons.base(fontSize: 18, color: SzColors.pasteles.white)
                        : Styles.texts.inButtons.base(fontSize: 18, color: textColor ?? SzColors.greys.greyc2),
                  ),
                )
              : TextButton(
                  style: enabled ? Styles.buttons.base(color: Colors.white) : Styles.buttons.base(color: SzColors.greys.greyF5),
                  onPressed: enabled ? onPressed : null,
                  child: Text(title, style: Styles.texts.inButtons.base(fontSize: 18, color: textColor ?? SzColors.greys.greyc2)),
                ),
        ),
      ),
    );
  }
}
