import 'package:flutter/services.dart';

import '../widgets/cell.dart';
import 'dart:math';
import 'dart:convert';

class CellFunctions {
  static final List<List<Cell>> cells = [[], [], [], [], [], [], [], [], []];

  static final List<List<int>> board = [
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0]
  ];

  static void createAllCells(List<List<int>> board) {
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

  static void updateAllCells(List<List<int>> board) {
    for (int i = 0; i < 9; i++) {
      for (int j = 0; j < 9; j++) {
        cells[i][j] = Cell(
            cellValue: board[i][j],
            disabled: board[i][j] != 0 ? true : false,
            row: i,
            column: j);
      }
    }
  }

  static Future getNewSudoku(String difficulty) async {
    final String jsonString =
        await rootBundle.loadString("assets/listOfSudokus.json");
    Map<String, dynamic> jsonMap = jsonDecode(jsonString);

    var randomSudoku =
        jsonMap[difficulty][Random().nextInt(jsonMap[difficulty].length)];

    int i, j;
    for (int k = 0; k < 81; k++) {
      i = k ~/ 9;
      j = k % 9;

      board[i][j] = randomSudoku[k];
    }

    if (cells[0].isEmpty) {
      createAllCells(board);
    } else {
      updateAllCells(board);
    }
  }

  static void resetSudoku() {
    for (int i = 0; i < 9; i++) {
      for (int j = 0; j < 9; j++) {
        cells[i][j].updateCellValue(board[i][j]);
        cells[i][j].updateDisabledValue();
      }
    }
  }

  static bool get isSudokuFilled {
    for (int i = 0; i < 9; i++) {
      for (int j = 0; j < 9; j++) {
        if (cells[i][j].cellValue == 0) {
          return false;
        }
      }
    }
    return true;
  }

  static bool isCellCorrect(Cell cell) {
    if (!checkRow(cell)) {
      return false;
    }

    if (!checkColumn(cell)) {
      return false;
    }

    if (!checkGrid(cell)) {
      return false;
    }

    return true;
  }

  static bool get isSudokuCorrect {
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

  static bool checkRow(Cell cell) {
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

  static bool checkColumn(Cell cell) {
    int col = cell.column;

    for (int row = 0; row < 9; row++) {
      if (row == cell.row) {
        continue;
      }

      if (cell.cellValue == cells[row][col].cellValue) {
        return false;
      }
    }
    return true;
  }

  static bool checkGrid(Cell cell) {
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
}
