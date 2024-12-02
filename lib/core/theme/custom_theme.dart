import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTheme {
  static const textFieldBorder =
      OutlineInputBorder(borderSide: BorderSide(color: Colors.black, width: 2));

  static final theme = ThemeData(
    dialogTheme: DialogTheme(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
    ),
    scaffoldBackgroundColor: Colors.white,
    drawerTheme: const DrawerThemeData(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      elevation: 0.0,
      centerTitle: true,
    ),
    primaryColor: Colors.black,
    textTheme: GoogleFonts.kanitTextTheme(),
    textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.black),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      enabledBorder: textFieldBorder,
      focusedBorder: textFieldBorder,
      errorBorder: textFieldBorder.copyWith(
          borderSide: const BorderSide(color: Colors.red, width: 2)),
      errorStyle:
          const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
      labelStyle:
          const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        textStyle: GoogleFonts.kanit(),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        textStyle: GoogleFonts.kanit(),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: Colors.black, width: 2),
        ),
      ),
    ),
  );
}
