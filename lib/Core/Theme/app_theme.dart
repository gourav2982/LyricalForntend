import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lyrical/Core/Theme/pallete.dart';

ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme.light(
    //* BACKGROUND and SURFACE
    surface: Pallete.lightEverliSurface,
    onSurface: Pallete.lightEverliOnSurface,
    background: Pallete.lightEverliBackground,
    onBackground: Pallete.lightEverliOnBackground,

    //* PRIMARY
    primary: Pallete.lightEverliPrimary,
    onPrimary: Pallete.lightEverliOnPrimary,
    primaryContainer: Pallete.lightEverliPrimary.withAlpha(70),
    onPrimaryContainer: Pallete.lightEverliOnBackground,

    //* SECONDARY
    secondary: Pallete.lightEverliSecondary,
    onSecondary: Pallete.lightEverliOnSecondary,
    secondaryContainer: Pallete.lightEverliSecondary.withAlpha(70),
    onSecondaryContainer: Pallete.lightEverliOnBackground,

    //* TERTIARY
    tertiary: Pallete.lightEverliSuccess,
    onTertiary: Pallete.lightEverliOnSuccess,
    tertiaryContainer: Pallete.lightEverliSuccess.withAlpha(70),
    onTertiaryContainer: Pallete.lightEverliOnBackground,

    //* ERROR
    error: Pallete.errorColor,
    onError: Colors.white,
    errorContainer: Pallete.errorColor.withAlpha(70), // 30% opacity
    onErrorContainer: Colors.black,
  ),
  useMaterial3: true,
  textTheme: GoogleFonts.nunitoSansTextTheme(),
  splashColor: Colors.transparent,
  highlightColor: Colors.transparent,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    enableFeedback: false,
    showSelectedLabels: true,
    showUnselectedLabels: true,
    selectedItemColor: Pallete.lightEverliPrimary,
    unselectedItemColor: Pallete.lightEverliSecondary,
    selectedIconTheme: IconThemeData(color: Pallete.lightEverliPrimary),
    unselectedIconTheme: IconThemeData(color: Pallete.lightEverliSecondary),
    selectedLabelStyle: TextStyle(color: Pallete.lightEverliPrimary),
    unselectedLabelStyle: TextStyle(color: Pallete.lightEverliSecondary),
  ),
);

ThemeData darkMode = ThemeData(
  colorScheme: ColorScheme.dark(
    //* BACKGROUND and SURFACE
    surface: Pallete.darkEverliSurface,
    onSurface: Pallete.darkEverliOnSurface,
    background: Pallete.darkEverliBackground,
    onBackground: Pallete.darkEverliOnBackground,

    //* PRIMARY
    primary: Pallete.darkEverliPrimary,
    onPrimary: Pallete.darkEverliOnPrimary,
    primaryContainer: Pallete.darkEverliPrimary.withAlpha(70),
    onPrimaryContainer: Pallete.darkEverliOnBackground,

    //* SECONDARY
    secondary: Pallete.darkEverliSecondary,
    onSecondary: Pallete.darkEverliOnSecondary,
    secondaryContainer: Pallete.darkEverliSecondary.withAlpha(70),
    onSecondaryContainer: Pallete.darkEverliOnBackground,

    //* TERTIARY
    tertiary: Pallete.darkEverliSuccess,
    onTertiary: Pallete.darkEverliOnSuccess,
    tertiaryContainer: Pallete.darkEverliSuccess.withAlpha(70),
    onTertiaryContainer: Pallete.darkEverliOnBackground,

    //* ERROR
    error: Pallete.darkEverliError,
    onError: Pallete.darkEverliOnError,
    errorContainer: Pallete.darkEverliError.withAlpha(70),
    onErrorContainer: Pallete.darkEverliOnBackground,
  ),
  useMaterial3: true,
  textTheme: GoogleFonts.nunitoSansTextTheme(),
  splashColor: Colors.transparent,
  highlightColor: Colors.transparent,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.shifting,
    showSelectedLabels: true,
    showUnselectedLabels: true,
    selectedItemColor: Pallete.darkEverliOnSurface,
    unselectedItemColor: Pallete.inactiveBottomBarItemColor,
    selectedIconTheme: IconThemeData(color: Pallete.darkEverliOnSurface),
    unselectedIconTheme:
        IconThemeData(color: Pallete.inactiveBottomBarItemColor),
    selectedLabelStyle: TextStyle(color: Pallete.darkEverliOnSurface),
    unselectedLabelStyle: TextStyle(color: Pallete.inactiveBottomBarItemColor),
  ),
);