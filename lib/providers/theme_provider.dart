import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../theme/colors_theme.dart';
import '../theme/style_theme.dart';

final themeProvider = Provider<ThemeProvider>((_) => ThemeProvider());

class ThemeProvider {
  static const platform = TargetPlatform.android;
  static const visualDensity = VisualDensity.compact;

  final ThemeData theme = ThemeData.light(useMaterial3: true).copyWith(
    colorScheme: colorSchemeLight,
    platform: platform,
    textTheme: textTheme,
    iconTheme: iconThemeData,
    visualDensity: visualDensity,
    elevatedButtonTheme: elevatedButtonThemeData,
    inputDecorationTheme: inputDecorationTheme,
    progressIndicatorTheme: progressIndicatorThemeData,
  );
}
