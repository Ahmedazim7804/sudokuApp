import 'package:flutter/material.dart';
import 'package:sudoku/widgets/aboutScreen.dart';
import 'package:sudoku/widgets/sudokuGrid.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() {
    return _HomeScreen();
  }
}

class _HomeScreen extends State<HomeScreen> {
  String _selectedDifficulty = 'testing';

  void goTogameScreen() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SudokuGrid(_selectedDifficulty)));
  }

  void goToinfoScreen() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const AboutScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      appBar: AppBar(
        title: const Text("Sudoku"),
        actions: [
          IconButton(
              onPressed: goToinfoScreen,
              icon: Icon(
                Icons.info,
                color: Theme.of(context).colorScheme.onPrimary,
              ))
        ],
      ),
      body: Center(
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
                      color:
                          Theme.of(context).colorScheme.onSecondaryContainer),
                  textAlign: TextAlign.center,
                ),
                DropdownButton(
                    value: _selectedDifficulty,
                    items: const [
                      DropdownMenuItem(
                        value: 'testing',
                        child: Text('Testing'),
                      ),
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
            ElevatedButton(onPressed: goTogameScreen, child: const Text("Play"))
          ],
        ),
      ),
    );
  }
}
