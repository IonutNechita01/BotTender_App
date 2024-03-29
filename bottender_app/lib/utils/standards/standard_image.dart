import 'package:bottender_app/utils/standards/standard_padding.dart';
import 'package:bottender_app/utils/standards/standard_spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class StandardImage extends StatelessWidget {
  final String url;
  final bool isRounded;

  const StandardImage(
      {required this.url,
      this.isRounded = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    final image = _getImage(url);
    return StandardPadding.horizontal(
        padding: StandardSpacing.size.regular,
        child: image);
  }

  _getImage(String url) {
    if (url.startsWith('http')) {
      return Image.network(url);
    }
    if (url.endsWith('.png') || url.endsWith('.jpg') || url.endsWith('.jpeg')) {
      return Image.asset(url);
    }
    return SvgPicture.asset(url);
  }
}
