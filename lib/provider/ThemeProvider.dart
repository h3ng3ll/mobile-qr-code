


import 'package:flutter/material.dart';
import 'package:qr_code_tt/services/ColorService.dart';

class ThemeProvider extends ChangeNotifier{


  bool _isLightTheme = true;
  ThemeData get  theme => _isLightTheme ? lightTheme : darkTheme;
  bool get isLightTheme => _isLightTheme;

  void switchTheme () {
    _isLightTheme = !_isLightTheme;
    notifyListeners();
  }

  /// themes
  static final lightTheme = ThemeData.light().copyWith(
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorService.purpleShade,
        textStyle: TextStyle(
          color: ColorService.white
        )
      )
    ),

      switchTheme: const SwitchThemeData(
        trackColor: MaterialStatePropertyAll(ColorService.grey),
        thumbColor: MaterialStatePropertyAll(ColorService.purpleShade)
      ),

  );

  static final darkTheme = ThemeData.dark().copyWith(
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: ColorService.purple,
            textStyle: TextStyle(
                color: ColorService.white
            )
        )
    )
  );





}