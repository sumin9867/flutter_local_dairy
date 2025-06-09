// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_telephone_dairy/core/theme/app_color.dart';
import 'package:local_telephone_dairy/core/theme/sizes.dart';

class AppTheme {
  static ThemeData theme(BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      appBarTheme: _appbarTheme(),
      fontFamily: GoogleFonts.poppins().fontFamily,
      canvasColor: AppColor.background, // Background color for the entire app
      scaffoldBackgroundColor: AppColor.background, // Background for the body
      inputDecorationTheme: inputDecorationTheme,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: AppColor.primaryColor,
        unselectedItemColor: AppColor.background,
        selectedLabelStyle: GoogleFonts.roboto(
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
        unselectedLabelStyle: GoogleFonts.roboto(
          fontWeight: FontWeight.w500,
        ),
      ),
      textTheme: _textTheme(),
      textSelectionTheme: _textSelectionTheme(),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),
    );
  }

  static TextSelectionThemeData _textSelectionTheme() {
    return TextSelectionThemeData(
      cursorColor: AppColor.primaryColor,
      selectionColor: AppColor.primaryColor.withOpacity(0.5),
      selectionHandleColor: AppColor.primaryColor,
    );
  }

  static TextTheme _textTheme() => TextTheme(
        titleLarge: GoogleFonts.inter(fontSize: Sizes.s12),
      );

  static AppBarTheme _appbarTheme() => AppBarTheme(
        elevation: 0.5,
        backgroundColor: AppColor.background, // Matches the body background color
        titleTextStyle: GoogleFonts.roboto(
          color: AppColor.dark, // Ensure title text color contrasts with the background
          fontSize: Sizes.s16,
        ),
        iconTheme: const IconThemeData(
          color: AppColor.dark, // Icon color should also be contrasting
        ),
      );

  static InputDecorationTheme get inputDecorationTheme => InputDecorationTheme(
        suffixIconColor: WidgetStateColor.resolveWith((states) {
          if (states.contains(WidgetState.error)) {
            return AppColor.error;
          }
          if (states.contains(WidgetState.focused)) {
            return AppColor.primaryColor;
          }
          if (states.contains(WidgetState.disabled)) {
            return Colors.grey.shade300;
          }
          return AppColor.gray;
        }),
        floatingLabelStyle: WidgetStateTextStyle.resolveWith((states) {
          TextStyle style = const TextStyle();
          if (states.contains(WidgetState.error)) {
            return style.copyWith(color: AppColor.error);
          }
          if (states.contains(WidgetState.focused)) {
            return style.copyWith(color: AppColor.primaryColor);
          }
          if (states.contains(WidgetState.disabled)) {
            return style.copyWith(color: Colors.grey.shade300);
          }
          return style.copyWith(color: AppColor.gray);
        }),
        labelStyle: WidgetStateTextStyle.resolveWith((states) {
          TextStyle style = const TextStyle();
          if (states.contains(WidgetState.error)) {
            return style.copyWith(color: AppColor.error);
          }
          if (states.contains(WidgetState.focused)) {
            return style.copyWith(color: AppColor.primaryColor);
          }
          if (states.contains(WidgetState.disabled)) {
            return style.copyWith(color: Colors.grey.shade300);
          }
          return style.copyWith(color: AppColor.gray);
        }),
        contentPadding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 16),
        border: MaterialStateOutlineInputBorder.resolveWith((states) {
          OutlineInputBorder inputBorder = const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(color: AppColor.gray),
          );
          if (states.contains(WidgetState.error)) {
            return inputBorder.copyWith(
              borderSide: const BorderSide(color: AppColor.error),
            );
          }
          if (states.contains(WidgetState.focused)) {
            return inputBorder.copyWith(
              borderSide: const BorderSide(color: AppColor.primaryColor),
            );
          }
          if (states.contains(WidgetState.disabled)) {
            return inputBorder.copyWith(
              borderSide: BorderSide(color: Colors.grey.shade300),
            );
          }
          return inputBorder;
        }),
      );
}
