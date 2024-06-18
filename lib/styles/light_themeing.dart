import 'package:flutter/material.dart';
import 'package:musicplayer/styles/colors.dart';

ThemeData lightMode = ThemeData(
    colorScheme: ColorScheme.light(
        surface: backgroundLight,
        primary: primaryLight,
        secondary: secondaryLight,
        inversePrimary: inversePrimaryLight,
        outline: whiteLight,
        outlineVariant: greyLight,
    )
);
