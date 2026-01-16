import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Colors
  static const Color primaryColor = Color(0xFF2563EB); // Vibrant Blue
  static const Color darkBackground = Color(0xFF0F172A); // Slate 900
  static const Color cardColor = Color(0xFF1E293B); // Slate 800
  static const Color secondaryColor = Color(0xFF60A5FA); // Blue 400

  // Gradients
  static const LinearGradient mainGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF020617), // Slate 950
      Color(0xFF0F172A), // Slate 900
      Color(0xFF172554), // Blue 950
      Color(0xFF1E1B4B), // Indigo 950
      Color(0xFF020617), // Slate 950
    ],
  );

  static const RadialGradient radialGradient = RadialGradient(
    center: Alignment(0.5, 0.5),
    radius: 0.5,
    colors: [
      Color(0xFF3B82F6),
      Color(0x001E3A8A),
    ], // Blue 500 to Transparent Blue
  );

  // Text Styles
  // Text Styles
  static TextStyle get navLink => GoogleFonts.cairo(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static TextStyle get heroTitle => GoogleFonts.cairo(
    fontSize: 50,
    fontWeight: FontWeight.w700,
    color: Colors.white,
    letterSpacing: 1,
  );

  static TextStyle get sectionTitle => GoogleFonts.cairo(
    fontSize: 40,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );

  static TextStyle get bodyText =>
      GoogleFonts.cairo(fontSize: 18, color: Colors.white70, height: 1.5);

  static ThemeData get theme => ThemeData.dark().copyWith(
    scaffoldBackgroundColor: const Color(0xFF0F172A), // Deep dark bg
    primaryColor: primaryColor,
    textTheme: GoogleFonts.cairoTextTheme().apply(
      bodyColor: Colors.white,
      displayColor: Colors.white,
    ),
  );
}
