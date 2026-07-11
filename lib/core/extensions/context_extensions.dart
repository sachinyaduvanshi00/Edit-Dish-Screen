import 'package:flutter/material.dart';

import '../constants/app_dimensions.dart';

/// Responsive helpers for [BuildContext].
extension ContextExtensions on BuildContext {
  double get screenWidth => MediaQuery.sizeOf(this).width;
  bool get isMobile => screenWidth < AppDimensions.mobileBreakpoint;
  bool get isTablet => screenWidth >= AppDimensions.mobileBreakpoint &&
      screenWidth < AppDimensions.tabletBreakpoint;
}

/// Convenience spacing widgets.
extension SpacingExtensions on num {
  SizedBox get verticalSpace => SizedBox(height: toDouble());
  SizedBox get horizontalSpace => SizedBox(width: toDouble());
}
