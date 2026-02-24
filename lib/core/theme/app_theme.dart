import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_pallete.dart';
import 'app_text.dart';

final class AppTheme {
  static final theme = ThemeData(
    fontFamily: GoogleFonts.poppins().fontFamily,

    colorScheme: ColorScheme.light(
      primary: AppPallete.primaryDarker,
      onPrimary: AppPallete.neutral100,
      surface: AppPallete.neutral100,
      onSurface: AppPallete.neutral900,
      error: AppPallete.errorNormal,
      onError: AppPallete.neutral100,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppPallete.primaryNormal,
        padding: .all(12),
        foregroundColor: AppPallete.neutral100,
        disabledBackgroundColor: AppPallete.primaryLightActive,
        disabledForegroundColor: AppPallete.primaryLightHover,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: .circular(50)),
      ),
    ),

    inputDecorationTheme: InputDecorationThemeData(
      labelStyle: AppText.regular16.copyWith(color: AppPallete.neutral600),
      floatingLabelStyle: AppText.regular20.copyWith(
        color: AppPallete.neutral900,
      ),
      contentPadding: .symmetric(vertical: 14, horizontal: 16),
      enabledBorder: _border(AppPallete.neutral400),
      focusedBorder: _border(AppPallete.primaryNormal),
      errorBorder: _border(AppPallete.errorNormal),
      focusedErrorBorder: _border(AppPallete.errorNormal),
      prefixIconConstraints: BoxConstraints(maxHeight: 20),
      suffixIconConstraints: BoxConstraints(maxHeight: 20),
    ),
  );

  static OutlineInputBorder _border(Color color) => OutlineInputBorder(
    borderRadius: .circular(10),
    borderSide: BorderSide(color: color),
  );
}
