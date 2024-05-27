import 'package:flutter/material.dart';

import '../core/app_export.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillBlack => BoxDecoration(
        color: appTheme.black90001,
      );

  static BoxDecoration get fillBlack900 => BoxDecoration(
        color: appTheme.black900,
      );

  static BoxDecoration get fillGray => BoxDecoration(
        color: appTheme.gray900,
      );

  static BoxDecoration get fillIndigo => BoxDecoration(
        color: appTheme.indigo50.withOpacity(0.08),
      );

  static BoxDecoration get fillLightBlue => BoxDecoration(
        color: appTheme.lightBlue800,
      );

  static BoxDecoration get fillTeal => BoxDecoration(
        color: appTheme.teal900,
      );

  static BoxDecoration get fillWhiteA => BoxDecoration(
        color: appTheme.whiteA700,
      );

// Outline decorations
  static BoxDecoration get outlineBlack => BoxDecoration(
        color: appTheme.gray900,
        border: Border.all(
          color: appTheme.black90001,
          width: 1.h,
        ),
      );

  static BoxDecoration get outlineIndigo => BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: appTheme.indigo50.withOpacity(0.36),
            width: 1.h,
          ),
        ),
      );

  static BoxDecoration get roundedColor =>
      BoxDecoration(borderRadius: BorderRadius.circular(30));
}

class BorderRadiusStyle {
  // Circle borders
  static BorderRadius get circleBorder16 => BorderRadius.circular(
        16.h,
      );

// Custom borders
  static BorderRadius get customBorderTL10 => BorderRadius.horizontal(
        left: Radius.circular(10.h),
      );
  static BorderRadius get customBorderTop10 => BorderRadius.vertical(
    top: Radius.circular(10.h),
  );
// Rounded borders
  static BorderRadius get roundedBorder10 => BorderRadius.circular(
        10.h,
      );

  static BorderRadius get roundedBorder4 => BorderRadius.circular(
        4.h,
      );
}
