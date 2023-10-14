import 'package:flutter/material.dart';
import 'package:sudoku/model/model.dart';
import 'cell.dart';
import 'subGrid.dart';

class SudokuGrid extends StatelessWidget {
  const SudokuGrid({super.key});

  @override
  Widget build(BuildContext context) {
    List<Cell> thisGridCells(int gridNumber) {
      int row = gridNumber ~/ 3;
      int column = gridNumber % 3;

      int sRow = row * 3;
      int eRow = (row + 1) * 3;
      int sColumn = column * 3;
      int eColumn = (column + 1) * 3;

      final List<Cell> thisGridCells = [];

      for (int i = sRow; i < eRow; i++) {
        for (int j = sColumn; j < eColumn; j++) {
          thisGridCells.add(CellFunctions.cells[i][j]);
        }
      }

      return thisGridCells;
    }

    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      children: [
        SubGrid(thisGridCells(0), 0),
        SubGrid(thisGridCells(1), 1),
        SubGrid(thisGridCells(2), 2),
        SubGrid(thisGridCells(3), 3),
        SubGrid(thisGridCells(4), 4),
        SubGrid(thisGridCells(5), 5),
        SubGrid(thisGridCells(6), 6),
        SubGrid(thisGridCells(7), 7),
        SubGrid(thisGridCells(8), 8),
      ],
    );
  }
}
