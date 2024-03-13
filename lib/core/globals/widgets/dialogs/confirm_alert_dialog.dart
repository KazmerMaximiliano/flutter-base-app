import 'package:flutter/material.dart';
import 'package:flutterbaseapp/core/globals/colors/smartzone_colors.dart';
import 'package:flutterbaseapp/core/globals/widgets/dialogs/custom_alert_dialog.dart';

void confirmAlertDialog(
  BuildContext context,
  String mensaje,
  void Function() onConfirm,
) {
  customAlertDialog(
    context,
    [
      Text(
        mensaje,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 16),
      ),
      const SizedBox(height: 8),
      Padding(
        padding: const EdgeInsets.all(6.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[_btn('Cancelar', () => Navigator.pop(context)), _btn("Confirmar", onConfirm)],
        ),
      )
    ],
  );
}

Widget _btn(String msg, void Function() action) {
  return TextButton(
    child: Text(msg, style: const TextStyle(color: SzColors.primary)),
    onPressed: action,
  );
}
