import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData lightTheme = _buildLightTheme();
final ThemeData darkTheme = _buildDarkTheme();

ThemeData _buildDarkTheme() {
  const Color primaryColor = Color(0xff5a2f8b);
  const Color secondaryColor = Color(0xff7a48b4);
  final ColorScheme colorScheme = const ColorScheme.dark().copyWith(
    primary: primaryColor,
    secondary: secondaryColor,
    onPrimary: Colors.white,
  );

  final ThemeData base = ThemeData(
    brightness: Brightness.dark,
    colorScheme: colorScheme,
    primaryColor: primaryColor,
    primaryColorDark: const Color(0xff572882),
    primaryColorLight: secondaryColor,
    indicatorColor: Colors.white,
    toggleableActiveColor: const Color(0xff8c62bb),
    canvasColor: const Color(0xFF262626),
    scaffoldBackgroundColor: const Color(0xFF262626),
    backgroundColor: const Color(0xFF262626),
    errorColor: const Color(0xFFB00020),
    textTheme: GoogleFonts.openSansTextTheme(),
    primaryTextTheme: GoogleFonts.openSansTextTheme(),
  );

  return base;
}

ThemeData _buildLightTheme() {
  const Color primaryColor = Color(0xff7a48b4);
  const Color secondaryColor = Color(0xffa87ed0);
  final ColorScheme colorScheme = const ColorScheme.light().copyWith(
    primary: primaryColor,
    secondary: secondaryColor,
  );
  final ThemeData base = ThemeData(
    brightness: Brightness.light,
    colorScheme: colorScheme,
    primaryColor: primaryColor,
    indicatorColor: Colors.white,
    toggleableActiveColor: const Color(0xffaa8be3),
    splashColor: Colors.white24,
    splashFactory: InkRipple.splashFactory,
    canvasColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    backgroundColor: Colors.white,
    errorColor: const Color(0xFFB00020),
    textTheme: GoogleFonts.openSansTextTheme(),
    primaryTextTheme: GoogleFonts.openSansTextTheme(),
  );

  return base;
}
