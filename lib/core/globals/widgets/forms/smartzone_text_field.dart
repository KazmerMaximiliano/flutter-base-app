import 'package:flutter/material.dart';
import 'package:flutterbaseapp/core/globals/colors/smartzone_colors.dart';
import 'package:flutterbaseapp/core/globals/styles/styles.dart';

class SmartzoneTextField extends StatelessWidget {
  final String title;
  final String? initialValue;
  final String? Function(dynamic)? validator;
  final TextStyle? textStyle;
  final void Function(String)? onChanged;
  final String hint;
  final TextInputType keyboardType;
  final bool obscure;

  const SmartzoneTextField({
    Key? key,
    required this.title,
    required this.validator,
    this.initialValue,
    this.textStyle,
    this.onChanged,
    this.hint = "",
    this.keyboardType = TextInputType.text,
    this.obscure = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0, bottom: 4.0),
          child: Text(
            title.toUpperCase(),
            style: textStyle ??
                TextStyle(
                  color: SzColors.greys.titles,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 0.5,
                  color: validator != null ? SzColors.pasteles.red : SzColors.greys.greyc2,
                ),
              ),
            ),
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              textCapitalization: keyboardType != TextInputType.emailAddress && !obscure ? TextCapitalization.sentences : TextCapitalization.none,
              style: Styles.texts.inLogin.input,
              obscureText: obscure,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hint,
                hintStyle: Styles.texts.inLogin.hint,
              ),
              cursorColor: SzColors.pasteles.red,
              keyboardType: keyboardType,
              onChanged: onChanged,
              initialValue: initialValue,
            ),
          ),
        ),
        /* Visibility(
          visible: validator != null,
          child: Container(
            padding: const EdgeInsets.fromLTRB(16.0, 8.0, 0.0, 16.0),
            width: double.infinity,
            child: Text(
              validator ?? '',
              style: TextStyle(color: SzColors.pasteles.red),
            ),
          ),
          replacement: const SizedBox(height: 16),
        ), */
      ],
    );
  }
}
