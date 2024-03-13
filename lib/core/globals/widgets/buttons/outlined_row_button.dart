import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutterbaseapp/core/globals/globals.dart';

class OutlinedRowButton extends StatefulWidget {
  const OutlinedRowButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.borderColor,
    this.borderWidth,
    this.bgColor,
    this.habilitado = true,
    this.padding,
    required this.icon,
  }) : super(key: key);

  final String title;
  final void Function() onPressed;
  final Color? borderColor;
  final double? borderWidth;
  final Color? bgColor;
  final EdgeInsets? padding;
  final bool habilitado;
  final IconData icon;

  @override
  State<OutlinedRowButton> createState() => _OutlinedRowButtonState();
}

class _OutlinedRowButtonState extends State<OutlinedRowButton> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? const EdgeInsets.symmetric(vertical: 16.0, horizontal: 0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: widget.bgColor ?? Colors.transparent,
          border: Border.all(
            color: widget.habilitado ? widget.borderColor ?? SzColors.pasteles.red : SzColors.greys.greyF5,
            width: widget.borderWidth ?? 0.5,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: TextButton(
          style: _buttonStyle(),
          onPressed: widget.onPressed,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: FaIcon(
                  widget.icon,
                  color: SzColors.greys.greyF5,
                ),
              ),
              const SizedBox(width: 32),
              Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  ButtonStyle _buttonStyle() {
    return ButtonStyle(
      padding: MaterialStateProperty.resolveWith(
        (states) => const EdgeInsets.all(12.0),
      ),
      foregroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.pressed)) {
          return SzColors.greys.black;
        }
        return SzColors.greys.greyF5;
      }),
      overlayColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.pressed)) {
          return SzColors.greys.greyF5;
        }
        return SzColors.greys.black;
      }),
    );
  }
}
