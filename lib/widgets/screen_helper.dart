import 'package:flutter/material.dart';

class ScreenHelper extends StatelessWidget {
  const ScreenHelper({
    super.key,
    required this.mobile,
    required this.desktop,
    required this.tablet,
  });

  final Widget mobile;
  final Widget desktop;
  final Widget tablet;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 800.0;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 800.0 &&
      MediaQuery.of(context).size.width < 1200.0;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1200.0;

  static double mobileMaxWidth(BuildContext context) =>
      MediaQuery.of(context).size.width * .8;

  static double mobileMaxHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth >= 1200) {
        return desktop;
      } else if (constraints.maxWidth >= 800.0 &&
          constraints.maxWidth < 1200.0) {
        return tablet;
      } else {
        return mobile;
      }
    });
  }
}
