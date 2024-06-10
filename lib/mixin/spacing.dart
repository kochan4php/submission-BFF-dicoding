import 'package:flutter/material.dart';

mixin Spacing {
  SizedBox gap({double x = 0.0, double y = 0.0}) {
    return SizedBox(
      width: x,
      height: y,
    );
  }
}
