import 'package:flutter/material.dart';
import 'package:flutterbaseapp/core/globals/colors/smartzone_colors.dart';
import 'package:flutterbaseapp/core/globals/widgets/dialogs/custom_alert_dialog.dart';

void confirmAlertDialogWithIcon(
  BuildContext context,
  String mensaje,
  void Function() onConfirm,
  IconData iconData,
) {
  customAlertDialog(
    context,
    [
      Icon(
        iconData,
        color: SzColors.pasteles.red,
      ),
      Text(
        mensaje,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 22),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[_btn('Cancelar', () => Navigator.pop(context)), const SizedBox(width: 16), _btn("Confirmar", onConfirm)],
        ),
      )
    ],
  );
}

Widget _btn(String msg, void Function() action) {
  return Expanded(
    child: ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.resolveWith(
          (states) => RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
        backgroundColor: MaterialStateProperty.resolveWith(
          (states) => SzColors.primary,
        ),
      ),
      child: Text(msg),
      onPressed: action,
    ),
  );
}
