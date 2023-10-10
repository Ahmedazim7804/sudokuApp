import 'package:flutter/material.dart';
import 'package:sudoku/widgets/sudoku.dart';
import 'package:sudoku/widgets/sudokuGrid.dart';
//import 'package:sudoku/widgets/sudokuGrid.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() {
    return _HomeScreen();
  }
}

class _HomeScreen extends State<HomeScreen> {
  String _selectedDifficulty = 'easy';

  void nextScreen() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SudokuGrid(_selectedDifficulty)));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(image: AssetImage('assets/sudoku.png')),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Difficulty : ",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: kColorScheme.onSecondaryContainer),
                textAlign: TextAlign.center,
              ),
              DropdownButton(
                  value: _selectedDifficulty,
                  items: const [
                    DropdownMenuItem(
                      value: 'easy',
                      child: Text('Easy'),
                    ),
                    DropdownMenuItem(
                      value: 'medium',
                      child: Text('Medium'),
                    ),
                    DropdownMenuItem(
                      value: 'hard',
                      child: Text('Hard'),
                    )
                  ],
                  onChanged: (diffculty) {
                    setState(() {
                      _selectedDifficulty = diffculty!;
                    });
                  }),
            ],
          ),
          ElevatedButton(onPressed: nextScreen, child: const Text("Play"))
        ],
      ),
    );
  }
}
