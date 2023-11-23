import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../utils/uuid.dart';

class CircleArea extends Circle {
  CircleArea({
    required LatLng center,
    required double radius,
    Color? fillColor,
    Color? strokeColor,
    int strokeWidth = 2,
  }) : super(
          circleId: CircleId(Uuid().generateV4()),
          center: center,
          radius: radius,
          fillColor: fillColor ?? Colors.blue.withAlpha(32),
          strokeColor: strokeColor ?? Colors.blue.withAlpha(192),
          strokeWidth: strokeWidth,
        );
}
