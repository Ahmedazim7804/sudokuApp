import 'package:flutter/material.dart';
import 'package:sudoku/widgets/sudokuGrid.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SudokuGrid();
  }
}
