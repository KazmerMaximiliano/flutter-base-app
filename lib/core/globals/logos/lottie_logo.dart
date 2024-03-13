import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

/// Usar con archivos .json de Lottie, se obvia "assets/" en el inicio y ".json" al final, usar la clase [LottieAssets]
class LottieLogo extends StatelessWidget {
  const LottieLogo({
    Key? key,
    required this.asset,
    this.height,
    this.fit,
  }) : super(key: key);
  final String asset;
  final double? height;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return Lottie.asset('assets/$asset.json', height: height, fit: fit);
  }
}
