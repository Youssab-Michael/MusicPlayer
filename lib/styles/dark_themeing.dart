import 'package:flutter/material.dart';
import 'package:musicplayer/styles/colors.dart';

ThemeData darkMode = ThemeData(
    colorScheme: ColorScheme.dark(
        surface: backgroundDark,
        primary: primaryDark,
        secondary: secondaryDark,
        inversePrimary: inversePrimaryDark,
        outline: whiteDark,
        outlineVariant: greyDark,
    )
);
