import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  // App Body Text (Default size: 16px)
  static TextStyle appBodyText({
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
    double? height,
  }) {
    return GoogleFonts.inter(
      fontSize: 16,
      color: color ?? Colors.black,
      fontWeight: fontWeight ?? FontWeight.normal,
      letterSpacing: letterSpacing ?? 0.0,
      height: height ?? 1.2,
    );
  }

  // App Heading Text (Default size: 18px)
  static TextStyle appHeadingText({
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
    double? height,
  }) {
    return GoogleFonts.inter(
      fontSize: 18,
      color: color ?? Colors.black,
      fontWeight: fontWeight ?? FontWeight.bold,
      letterSpacing: letterSpacing ?? 0.0,
      height: height ?? 1.2,
    );
  }

  // App Title Text (Default size: 24px)
  static TextStyle appTitleText({
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
    double? height,
  }) {
    return GoogleFonts.inter(
      fontSize: 24,
      color: color ?? Colors.black,
      fontWeight: fontWeight ?? FontWeight.bold,
      letterSpacing: letterSpacing ?? 0.0,
      height: height ?? 1.3,
    );
  }

  // App Caption Text (Default size: 14px)
  static TextStyle appCaptionText({
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
    double? height,
  }) {
    return GoogleFonts.inter(
      fontSize: 14,
      color: color ?? Colors.black,
      fontWeight: fontWeight ?? FontWeight.normal,
      letterSpacing: letterSpacing ?? 0.0,
      height: height ?? 1.1,
    );
  }
}
