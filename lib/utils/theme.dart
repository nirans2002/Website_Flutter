import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// dark theme
final darkTheme = ThemeData(
  fontFamily: "FiraCode",
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFFFF9900),
    onPrimary: Color(0xFFABB2BF),
    secondary: Color.fromARGB(255, 240, 114, 114),
    onSecondary: Color.fromARGB(255, 180, 54, 54),
    error: Colors.red,
    onError: Colors.black,
    surface: Color(0xFF282C33),
    onSurface: Color(0xFFABB2BF),
  ),
  primaryColor: const Color.fromARGB(255, 46, 22, 22),
  scaffoldBackgroundColor: const Color(0xFF282C33),
  textTheme: GoogleFonts.firaCodeTextTheme(),
);
