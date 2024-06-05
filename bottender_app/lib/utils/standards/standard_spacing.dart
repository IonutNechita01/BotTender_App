import 'package:bottender_app/utils/style/dimensions.dart';
import 'package:flutter/material.dart';

abstract class StandardSpacing {
  static Widget vertical(double size) {
    return _StandardSpacing(size: size, isColumn: true, isRow: false);
  }

  static Widget horizontal(double size) {
    return _StandardSpacing(size: size, isRow: true, isColumn: false);
  }

  static Widget small() {
    return _StandardSpacing.small();
  }

  static Widget medium() {
    return _StandardSpacing.medium();
  }

  static Widget regular() {
    return _StandardSpacing.regular();
  }
}

class _StandardSpacing extends StatelessWidget {
  final double size;
  final bool? isRow;
  final bool? isColumn;
  const _StandardSpacing({required this.size, this.isRow, this.isColumn});

  factory _StandardSpacing.small() {
    return const _StandardSpacing(size: StandardSpacingSize.small);
  }
  factory _StandardSpacing.medium() {
    return const _StandardSpacing(size: StandardSpacingSize.medium);
  }

  factory _StandardSpacing.regular() {
    return const _StandardSpacing(size: StandardSpacingSize.regular);
  }

  @override
  Widget build(BuildContext context) {
    final isRow =
        this.isRow ?? context.findAncestorWidgetOfExactType<Row>() != null;

    final isColumn = this.isColumn ??
        (context.findAncestorWidgetOfExactType<Column>() != null ||
            context.findAncestorWidgetOfExactType<ListView>() != null);

    return SizedBox(
      width: isRow ? size : 0,
      height: isColumn ? size : 0,
    );
  }
}
