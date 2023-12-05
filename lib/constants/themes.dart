// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'color_schemes.dart';

var darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: colorSchemeDark,
  brightness: Brightness.dark,
);

var lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: colorSchemeLight,
  brightness: Brightness.light,
);