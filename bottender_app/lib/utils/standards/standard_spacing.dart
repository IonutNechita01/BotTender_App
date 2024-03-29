// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

enum Orentation { vertical, horizontal }

class StandardSpacing {
  static _StandardSpacingModel get vertical =>
      _StandardSpacingModel(orientation: Orentation.vertical);
  static _StandardSpacingModel get horizontal =>
      _StandardSpacingModel(orientation: Orentation.horizontal);
  static _StandardSpacingSizeModel get size => _StandardSpacingSizeModel();
}

class _StandardSpacingSizeModel {
  final double small = 4;
  final double medium = 8;
  final double regular = 16;
}

class _StandardSpacingModel {
  final Orentation orientation;
  final _StandardSpacingSizeModel _size = _StandardSpacingSizeModel();

  _StandardSpacingModel({
    required this.orientation,
  });

  Widget get small => _getSpacingWidget(size: _size.small);

  Widget get medium => _getSpacingWidget(size: _size.medium);

  Widget get regular => _getSpacingWidget(size: _size.regular);

  Widget _getSpacingWidget({required double size}) {
    return SizedBox(
      height: Orentation.vertical == orientation ? size : 0,
      width: Orentation.horizontal == orientation ? size : 0,
    );
  }
}
