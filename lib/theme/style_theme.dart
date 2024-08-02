import 'package:fleasy/fleasy.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors_theme.dart';

Future<void> downloadGoogleFonts() async {
  try {
    await GoogleFonts.pendingFonts([
      GoogleFonts.nunitoSans(),
      GoogleFonts.lato(),
      GoogleFonts.nunitoSansTextTheme(),
      GoogleFonts.latoTextTheme()
    ]);
  } catch (_) {}
}

TextStyle titleMedium() {
  return GoogleFonts.nunitoSans(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: primary,
  );
}

final latoTextTheme = GoogleFonts.latoTextTheme(
  ThemeData.light(useMaterial3: true).textTheme,
);

final textTheme = latoTextTheme.copyWith(
  titleLarge: GoogleFonts.nunitoSans(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: primary,
  ),
  titleMedium: titleMedium(),
);

final elevatedButtonThemeData = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    backgroundColor: primary,
    foregroundColor: onPrimary,
    textStyle: titleMedium(),
    padding: const EdgeInsets.symmetric(
      vertical: Insets.xl * 2,
      horizontal: Insets.xxl * 4,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(Insets.xxl),
    ),
  ),
);
