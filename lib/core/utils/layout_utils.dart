import 'package:flutter/material.dart';

class LayoutUtils {
  static double getHorizontalPadding(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (width > 1200) {
      return (width - 1200) / 2;
    } else if (width > 800) {
      return 60;
    } else {
      return 20;
    }
  }

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 800;
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 800 &&
      MediaQuery.of(context).size.width < 1200;
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1200;
}
