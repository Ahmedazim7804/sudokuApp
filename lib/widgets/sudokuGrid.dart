import 'package:flutter/material.dart';
import 'package:sudoku/widgets/cell.dart';
import 'subGrid.dart';

class SudokuGrid extends StatelessWidget {
  SudokuGrid({super.key});

  final List<List<int>> board = [
    [3, 9, 1, 2, 5, 6, 8, 4, 7],
    [7, 6, 4, 3, 1, 8, 9, 5, 2],
    [2, 8, 5, 7, 4, 9, 1, 3, 6],
    [9, 3, 7, 8, 2, 4, 6, 1, 5],
    [1, 4, 2, 6, 9, 5, 3, 7, 8],
    [8, 5, 6, 1, 3, 7, 4, 2, 9],
    [6, 2, 3, 9, 7, 1, 5, 8, 4],
    [5, 7, 8, 4, 6, 3, 2, 9, 1],
    [4, 1, 9, 5, 8, 2, 7, 6, 0]
  ];

  final List<List<Cell>> cells = [[], [], [], [], [], [], [], [], []];

  void addCells() {
    for (int i = 0; i < 9; i++) {
      for (int j = 0; j < 9; j++) {
        cells[i].add(Cell(
            cellValue: board[i][j],
            disabled: board[i][j] != 0 ? true : false,
            row: i,
            column: j));
      }
    }
  }

  bool get isSudokuFilled {
    for (int i = 0; i < 9; i++) {
      for (int j = 0; j < 9; j++) {
        if (cells[i][j].cellValue == 0) {
          return false;
        }
      }
    }
    return true;
  }

  bool get isSudokuCorrect {
    for (int i = 0; i < 9; i++) {
      for (int j = 0; j < 9; j++) {
        var cell = cells[i][j];

        if (!checkRow(cell)) {
          return false;
        }

        if (!checkColumn(cell)) {
          return false;
        }

        if (!checkGrid(cell)) {
          return false;
        }
      }
    }
    return true;
  }

  bool checkRow(Cell cell) {
    int row = cell.row;

    for (int col = 0; col < 9; col++) {
      if (col == cell.column) {
        continue;
      }

      if (cell.cellValue == cells[row][col].cellValue) {
        return false;
      }
    }

    return true;
  }

  bool checkColumn(Cell cell) {
    int col = cell.column;

    for (int row = 0; row < 9; row++) {
      if (row == cell.row) {
        continue;
      }

      if (cell.cellValue == cells[row][col].cellValue) {
        cell.hasError = true;

        return false;
      }
    }
    return true;
  }

  bool checkGrid(Cell cell) {
    int col = cell.column;
    int row = cell.row;

    int sRow = (row ~/ 3) * 3;
    int eRow = ((row ~/ 3) + 1) * 3;
    int sCol = (col ~/ 3) * 3;
    int eCol = ((col ~/ 3) + 1) * 3;

    for (int i = sRow; i < eRow; i++) {
      for (int j = sCol; j < eCol; j++) {
        if (i == row && j == col) {
          continue;
        }

        if (cell.cellValue == cells[i][j].cellValue) {
          return false;
        }
      }
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    addCells();

    void checkSudoku() {
      if (!isSudokuFilled) {
        showDialog(
            context: context,
            builder: (ctx) {
              return const AlertDialog(
                  title: Text("Message"),
                  content: Text("Complete The Sudoku First."));
            });
      }

      if (!isSudokuCorrect) {
        showDialog(
            context: context,
            builder: (ctx) {
              return const AlertDialog(
                  title: Text("Message"), content: Text("Sudoku is wrong"));
            });
      } else {
        showDialog(
            context: context,
            builder: (ctx) {
              return const AlertDialog(
                  title: Text("Message"), content: Text("Sudoku is Correct"));
            });
      }
    }

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
          thisGridCells.add(cells[i][j]);
        }
      }

      return thisGridCells;
    }

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 3,
            children: [
              SubGrid(thisGridCells(0)),
              SubGrid(thisGridCells(1)),
              SubGrid(thisGridCells(2)),
              SubGrid(thisGridCells(3)),
              SubGrid(thisGridCells(4)),
              SubGrid(thisGridCells(5)),
              SubGrid(thisGridCells(6)),
              SubGrid(thisGridCells(7)),
              SubGrid(thisGridCells(8)),
            ],
          ),
          ElevatedButton(
              onPressed: checkSudoku, child: const Text("Check Sudoku"))
        ],
      ),
    );
  }
}
