import 'package:flutter/material.dart';
import 'package:flutterbaseapp/core/globals/colors/smartzone_colors.dart';
import 'package:flutterbaseapp/core/globals/navigate_service.dart';

enum SnackState { ok, error, loading, back }

void showCustomSnackbar(
  BuildContext context, {
  required String mensaje,
  required SnackState snackState,
  bool checkIconIfOk = false,
}) {
  Color bgColor = SzColors.primary;
  Widget icon = const Icon(Icons.check);

  switch (snackState) {
    case SnackState.ok:
      bgColor = SzColors.pasteles.green;
      icon = checkIconIfOk ? const Icon(Icons.check, color: Colors.white) : const SizedBox();
      break;
    case SnackState.error:
      bgColor = SzColors.pasteles.red;
      icon = const Icon(Icons.warning_amber_rounded, color: Colors.white);
      break;

    case SnackState.loading:
      bgColor = SzColors.pasteles.amber;
      icon = const CircularProgressIndicator(color: Colors.white);
      break;
    case SnackState.back:
      bgColor = SzColors.pasteles.red;
      icon = TextButton(
        child: const Text(
          "Volver",
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          Nav.pop(context);
        },
      );
      break;
  }

  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 5),
        dismissDirection: DismissDirection.horizontal,
        backgroundColor: bgColor,
        content: Row(
          children: [
            Expanded(
              child: Text(
                mensaje,
                style: const TextStyle(color: Colors.white),
              ),
            ),
            icon,
          ],
        ),
      ),
    );
}
