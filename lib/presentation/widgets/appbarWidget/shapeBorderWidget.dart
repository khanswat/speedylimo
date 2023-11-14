import 'package:flutter/material.dart';

class ShapedWidgetBorder extends RoundedRectangleBorder {
  ShapedWidgetBorder({
    required this.padding,
    side = BorderSide.none,
    borderRadius = BorderRadius.zero,
  }) : super(side: side, borderRadius: borderRadius);
  final double padding;

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return Path()
      ..moveTo(rect.width - 10.0, rect.top)
      ..lineTo(rect.width - 15.0, rect.top - 10.0)
      ..lineTo(rect.width - 23.0, rect.top)
      ..addRRect(borderRadius.resolve(textDirection).toRRect(Rect.fromLTWH(
          rect.left, rect.top, rect.width, rect.height - padding)));
  }
}
