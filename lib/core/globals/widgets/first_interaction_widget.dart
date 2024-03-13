import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
import 'package:flutterbaseapp/core/globals/colors/smartzone_colors.dart';

// import '../../providers/smartzone_global_repository_provider.dart';

class FirstInteractionWidget extends StatelessWidget {
  const FirstInteractionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Column(
          children: [
            const Divider(thickness: 0.25),
            const SizedBox(height: 4),
            // ${Provider.of<SmartzoneGlobalRepositoryProvider>(context, listen: false).user!.name}
            Text(
              "¡Hola [Usuario]! ¿Dónde nos conectamos?",
              style: TextStyle(
                color: SzColors.greys.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              "Conectar te permitirá interactuar con el\nlugar y los conectados.",
              style: TextStyle(color: SzColors.greys.grey57, fontSize: 11),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
