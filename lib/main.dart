import 'package:flutter/material.dart';
import 'package:sudoku/widgets/homeScreen.dart';

ColorScheme colorScheme = ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 140, 1, 248),
    brightness: Brightness.dark);
void main() {
  runApp(MaterialApp(
    themeMode: ThemeMode.dark,
    darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: colorScheme,
        appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: colorScheme.onSecondaryContainer,
            titleTextStyle: TextStyle(
                color: colorScheme.onPrimary,
                fontWeight: FontWeight.bold,
                fontSize: 20))),
    home: const HomeScreen(),
  ));
}
