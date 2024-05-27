import 'package:flutter/material.dart';
import '../core/app_export.dart';
extension on TextStyle {
  TextStyle get sFProText {
    return copyWith(
      fontFamily: 'SF Pro Text',
    );
  }
  TextStyle get sFPro {
    return copyWith(
      fontFamily: 'SF Pro',
    );
  }
  TextStyle get sFProDisplay {
    return copyWith(
      fontFamily: 'SF Pro Display',
    );
  }
}
/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.
class CustomTextStyles {
  // Label text style
  static get labelLargeGreen500 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.green500,
      );
  static get labelLargeSFProDisplay => theme.textTheme.labelLarge!.sFProDisplay;
  static get labelLargeSemiBold => theme.textTheme.labelLarge!.copyWith(
        fontWeight: FontWeight.w600,
      );
  static get labelLargeWhiteA700 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.whiteA700,
      );
  static get labelLargeWhiteA700SemiBold =>
      theme.textTheme.labelLarge!.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w600,
      );
  static get labelMediumBluegray400 => theme.textTheme.labelMedium!.copyWith(
        color: appTheme.blueGray400,
        fontSize: 10.fSize,
        fontWeight: FontWeight.w600,
      );
  static get labelMediumGreen500 => theme.textTheme.labelMedium!.copyWith(
        color: appTheme.green500,
        fontSize: 10.fSize,
        fontWeight: FontWeight.w600,
      );
// Title text style
  static get titleLarge23 => theme.textTheme.titleLarge!.copyWith(
        fontSize: 23.fSize,
      );
  static get titleLargeSFPro => theme.textTheme.titleLarge!.sFPro.copyWith(
        fontSize: 23.fSize,
        fontWeight: FontWeight.w700,
      );
  static get titleMedium17 => theme.textTheme.titleMedium!.copyWith(
        fontSize: 17.fSize,
    fontWeight: FontWeight.w500,
    color: appTheme.green500,
      );
  static get titleMediumGray50 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray50,
        fontSize: 17.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumMedium => theme.textTheme.titleMedium!.copyWith(
        fontSize: 17.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallIndigo50 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.indigo50.withOpacity(0.6),
      );
  static get titleSmallSFPro => theme.textTheme.titleSmall!.sFPro;
  static get titleSmallSFProText => theme.textTheme.titleSmall!.sFProText;
  static get titleSmallSFProTextGreen500 =>
      theme.textTheme.titleSmall!.sFProText.copyWith(
        color: appTheme.green500,
      );
  static get titleSmallSFProTextGreen500_1 =>
      theme.textTheme.titleSmall!.sFProText.copyWith(
        color: appTheme.green500,
      );
  static get titleSmallSFProTextIndigo50 =>
      theme.textTheme.titleSmall!.sFProText.copyWith(
        color: appTheme.indigo50.withOpacity(0.6),
      );
  static get titleSmallSFProTextIndigo50_1 =>
      theme.textTheme.titleSmall!.sFProText.copyWith(
        color: appTheme.indigo50.withOpacity(0.6),
      );
  static get titleSmallSFProTextIndigo50_2 =>
      theme.textTheme.titleSmall!.sFProText.copyWith(
        color: appTheme.indigo50.withOpacity(0.6),
      );
  static get titleSmallSFProTextMedium =>
      theme.textTheme.titleSmall!.sFProText.copyWith(
        fontWeight: FontWeight.w500,
      );
  static get titleSmallSFProTextMedium_1 =>
      theme.textTheme.titleSmall!.sFProText.copyWith(
        fontWeight: FontWeight.w500,
      );
}