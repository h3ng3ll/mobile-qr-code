





import 'package:flutter/material.dart';
import 'package:qr_code_tt/services/ColorService.dart';

class StyleService{

  /// Big title 32 font w700 Black
  static TextStyle titleLargest (bool isLightTheme) => titleLarge(isLightTheme).copyWith(fontSize: 32 , fontWeight: FontWeight.w700);

    /// Big title
    static TextStyle titleLarge (bool isLightTheme) {

    TextStyle theme = const TextStyle(
      fontSize: 24,
      color: ColorService.black
    );
    TextStyle darkTheme = theme.copyWith(color: ColorService.white);

    return isLightTheme ? theme : darkTheme;
  }

  /// 18 font Black
  static TextStyle titleSmall (bool isLightTheme) => titleLarge(isLightTheme).copyWith(fontSize: 18 );

  /// display content 18 font PurpleShade
     static TextStyle bodyMedium (bool isLightTheme) {
      TextStyle theme = const TextStyle(
          fontSize: 18,
          color: ColorService.purpleShade
      );

      TextStyle darkTheme = theme.copyWith(color: ColorService.purple);
      return isLightTheme ? theme : darkTheme;
  }
  /// 14 font Grey
  static TextStyle displaySmall (bool isLightTheme) {
    TextStyle theme = const TextStyle(
        fontSize: 14,
        color: ColorService.grey
    );

    TextStyle darkTheme = theme.copyWith(color: ColorService.grey);
    return isLightTheme ? theme : darkTheme;
  }

}