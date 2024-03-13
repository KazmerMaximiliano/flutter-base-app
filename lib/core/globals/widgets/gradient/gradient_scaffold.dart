import 'package:flutter/material.dart';
import 'package:flutterbaseapp/core/globals/colors/smartzone_colors.dart';

class GradientScaffold extends StatelessWidget {
  const GradientScaffold({
    Key? key,
    this.appBar,
    required this.body,
    this.bodyBehingAppBar = false,
  }) : super(key: key);

  final PreferredSize? appBar;
  final Widget body;
  final bool bodyBehingAppBar;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          stops: [0.01, 0.99],
          colors: SzColors.degrade,
        ),
      ),
      child: Scaffold(
        extendBodyBehindAppBar: bodyBehingAppBar,
        backgroundColor: Colors.transparent,
        appBar: appBar,
        body: body,
      ),
    );
  }
}
