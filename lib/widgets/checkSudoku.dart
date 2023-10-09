import 'cell.dart';

bool isSudokuCorrect(List<List<Cell>> cells) {
  for (int i = 0; i < 9; i++) {
    for (int j = 0; j < 9; j++) {
      var cell = cells[i][j];

      if (!checkRow(cells, cell)) {
        return false;
      }

      if (!checkColumn(cells, cell)) {
        return false;
      }

      if (!checkGrid(cells, cell)) {
        return false;
      }
    }
  }
  return true;
}

bool isCellCorrect(List<List<Cell>> cells, Cell cell) {
  if (!checkRow(cells, cell)) {
    return false;
  }

  if (!checkColumn(cells, cell)) {
    return false;
  }

  if (!checkGrid(cells, cell)) {
    return false;
  }
  return true;
}

bool checkRow(List<List<Cell>> cells, Cell cell) {
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

bool checkColumn(List<List<Cell>> cells, Cell cell) {
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

bool checkGrid(List<List<Cell>> cells, Cell cell) {
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
