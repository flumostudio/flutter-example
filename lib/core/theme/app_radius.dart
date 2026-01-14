import 'package:flutter/widgets.dart';

/// Centralized corner radius definitions.
class AppRadius {
  static const double r = 12;
  static const Radius r12 = Radius.circular(r);
  static const BorderRadius card = BorderRadius.all(r12);
}
