import 'package:flutter/material.dart';
import 'package:flutterbaseapp/core/globals/logos/simplifiers/simplifiers.dart';
import 'package:flutterbaseapp/core/globals/styles/styles.dart';

/// Usar con GIF, se obvia "assets/" en el inicio y ".gif" al final, usar la clase [GifAssets]
class GifLogo extends StatelessWidget {
  const GifLogo({
    Key? key,
    required this.asset,
    this.height,
  }) : super(key: key);
  final String asset;
  final int? height;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/$asset.gif',
      height: height != null ? Styles.texts.fontSizeByWidth(context, height ?? 10) : null,
    );
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key? key,
    this.big = true,
  }) : super(key: key);

  final bool big;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GifLogo(
        asset: big ? GifAssets.loading.loadingNoBg : GifAssets.loading.loadingCuadrado,
      ),
    );
  }
}
