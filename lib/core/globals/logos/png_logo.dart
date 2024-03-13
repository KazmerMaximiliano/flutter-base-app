import 'package:flutter/material.dart';
import 'package:flutterbaseapp/core/globals/logos/simplifiers/simplifiers.dart';
import 'package:flutterbaseapp/core/globals/styles/styles.dart';

/// Usar con PNG, se obvia "assets/" en el inicio y ".png" al final, usar la clase [PngAssets]
class PngLogo extends StatelessWidget {
  const PngLogo({
    Key? key,
    required this.asset,
    this.height,
  }) : super(key: key);
  final String asset;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final _url = 'assets/$asset.png';
    return Image.asset(
      _url,
      height: height != null ? Styles.texts.fontSizeByWidth(context, height?.toInt() ?? 30.toInt()) : 150,
    );
  }
}

/// Usar con PNG, se obvia "assets/" en el inicio y ".png" al final, usar la clase [PngAssets]
class PngBigLogo extends StatelessWidget {
  const PngBigLogo({Key? key, required this.asset}) : super(key: key);
  final String asset;
  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/$asset.png');
  }
}

class PngIconButton extends StatelessWidget {
  const PngIconButton({Key? key, required this.asset, this.onPressed}) : super(key: key);
  final String asset;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12.0),
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: PngLogo(
          asset: asset,
          height: 30,
        ),
      ),
    );
  }
}

class SmartzoneLogo extends StatelessWidget {
  const SmartzoneLogo({Key? key, this.verticalPadding = 24.0}) : super(key: key);
  final double verticalPadding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: verticalPadding, horizontal: 96.0),
      child: Image.asset("assets/${PngAssets.logos.logoCompleto}.png"),
    );
  }
}
