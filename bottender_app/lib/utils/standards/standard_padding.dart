import 'package:flutter/material.dart';

class StandardPadding extends StatelessWidget {
  final Widget child;
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;

  const StandardPadding({
    required this.child,
    this.top,
    this.bottom,
    this.left,
    this.right,
    super.key,
  });

  factory StandardPadding.all({
    required Widget child,
    required double padding,
  }) {
    return StandardPadding(
      top: padding,
      bottom: padding,
      left: padding,
      right: padding,
      child: child,
    );
  }

  factory StandardPadding.symmetric({
    required Widget child,
    double? vertical,
    double? horizontal,
  }) {
    return StandardPadding(
      top: vertical,
      bottom: vertical,
      left: horizontal,
      right: horizontal,
      child: child,
    );
  }

  factory StandardPadding.only({
    required Widget child,
    double? top,
    double? bottom,
    double? left,
    double? right,
  }) {
    return StandardPadding(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: child,
    );
  }

  factory StandardPadding.zero({
    required Widget child,
  }) {
    return StandardPadding(
      top: 0,
      bottom: 0,
      left: 0,
      right: 0,
      child: child,
    );
  }

  factory StandardPadding.vertical({
    required Widget child,
    required double padding,
  }) {
    return StandardPadding(
      top: padding,
      bottom: padding,
      left: 0,
      right: 0,
      child: child,
    );
  }

  factory StandardPadding.horizontal({
    required Widget child,
    required double padding,
  }) {
    return StandardPadding(
      top: 0,
      bottom: 0,
      left: padding,
      right: padding,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: top ?? 0,
        bottom: bottom ?? 0,
        left: left ?? 0,
        right: right ?? 0,
      ),
      child: child,
    );
  }
}