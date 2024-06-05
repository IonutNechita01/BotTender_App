import 'dart:io';

import 'package:bottender_app/utils/standards/standard_padding.dart';
import 'package:bottender_app/utils/style/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class StandardImage extends StatelessWidget {
  final String url;
  final double? height;
  final double? width;
  final double? padding;
  final BoxFit fit;
  final String placeholder;

  const StandardImage({
    required this.url,
    this.placeholder = 'assets/images/placeholder.png',
    this.height,
    this.width,
    this.padding,
    this.fit = BoxFit.scaleDown,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final image = _getImage(url);
    return StandardPadding.horizontal(
        padding: padding ?? StandardSpacingSize.regular,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: height ?? double.infinity,
            maxWidth: width ?? double.infinity,
          ),
          child: image,
        ),);
  }

  Widget _getImage(String url) {
    if (url.startsWith('http')) {
      return Image.network(
        url,
        fit: fit,
        errorBuilder: (context, error, stackTrace) {
          return Image.asset(placeholder, fit: fit);
        },
      );
    }
    if (url.startsWith('assets/') &&
        (url.endsWith('.png') ||
            url.endsWith('.jpg') ||
            url.endsWith('.jpeg'))) {
      return Image.asset(url, fit: fit);
    }
    if (url.startsWith('assets/') && url.endsWith('.svg')) {
      return SvgPicture.asset(url, fit: fit);
    }
    if (url.endsWith('.jpg') || url.endsWith('.jpeg') || url.endsWith('.png')) {
      return Image.file(File(url), fit: fit);
    }
    return Image.asset(placeholder, fit: fit);
  }
}

class StandardFileImage extends StatelessWidget {
  final File file;
  final double? height;
  final double? width;
  final double? padding;
  final BoxFit? fit;

  const StandardFileImage({
    required this.file,
    this.height,
    this.width,
    this.padding,
    this.fit,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StandardPadding.horizontal(
        padding: padding ?? StandardSpacingSize.regular,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: height ?? double.infinity,
            maxWidth: width ?? double.infinity,
          ),
          child: Image.file(file, fit: fit ?? BoxFit.fill),
        ),);
  }
}
