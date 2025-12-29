
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Colors
  static const Color primaryPurple = Color(0xFF7127BA);
  static const Color darkBackground = Color(0xFF11071F); // Approximate deep background
  static const Color cardColor = Color(0xFF2B215A);
  static const Color lightPurple = Color(0xFFA362FF);
  
  // Gradients
  static const LinearGradient mainGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF130328), Color(0xFF250F42), Color(0xFF37116D), Color(0xFF261045), Color(0xFF190634)],
  );

  static const RadialGradient radialGradient = RadialGradient(
    center: Alignment(0.5, 0.5),
    radius: 0.5,
    colors: [Color(0xFF763CAC), Color(0x00320E85)],
  );

  // Text Styles
  static TextStyle get navLink => GoogleFonts.plusJakartaSans(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static TextStyle get heroTitle => GoogleFonts.preahvihear(
    fontSize: 50,
    fontWeight: FontWeight.w400,
    color: Colors.white,
    letterSpacing: 1,
  );

  static TextStyle get sectionTitle => GoogleFonts.preahvihear(
    fontSize: 40,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  static TextStyle get bodyText => GoogleFonts.preahvihear(
    fontSize: 18,
    color: Colors.white70,
    height: 1.5,
  );
  
  static ThemeData get theme => ThemeData.dark().copyWith(
    scaffoldBackgroundColor: const Color(0xFF0F0715), // Deep dark bg
    primaryColor: primaryPurple,
    textTheme: GoogleFonts.preahvihearTextTheme().apply(
      bodyColor: Colors.white,
      displayColor: Colors.white,
    ),
  );
}
