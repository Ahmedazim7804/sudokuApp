import 'package:flutter/material.dart';
import 'package:sudoku/widgets/homeScreen.dart';

ColorScheme kColorScheme = ColorScheme.fromSeed(
    seedColor: Color.fromARGB(255, 140, 1, 248), brightness: Brightness.dark);

class Sudoku extends StatelessWidget {
  const Sudoku({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark().copyWith(
          useMaterial3: true,
          colorScheme: kColorScheme,
          appBarTheme: AppBarTheme().copyWith(
              backgroundColor: kColorScheme.onSecondaryContainer,
              titleTextStyle: TextStyle(
                  color: kColorScheme.onPrimary,
                  fontWeight: FontWeight.bold,
                  fontSize: 20))),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Sudoku"),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.menu,
                  color: kColorScheme.onPrimary,
                ))
          ],
        ),
        body: HomeScreen(),
      ),
    );
  }
}
