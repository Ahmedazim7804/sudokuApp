List<List<int>> solvedSudoku = [];

List<int> getPossibleValues(int row, int column, List<List<int>> sudoku) {
  List<int> rowValues = getRowValues(row, sudoku);
  List<int> columnValues = getColumnValues(column, sudoku);
  List<int> gridValues = getGridValues(row, column, sudoku);

  List<int> possV = [1, 2, 3, 4, 5, 6, 7, 8, 9];

  for (var v in rowValues) {
    if (possV.contains(v)) {
      possV.remove(v);
    }
  }

  for (var v in columnValues) {
    if (possV.contains(v)) {
      possV.remove(v);
    }
  }

  for (var v in gridValues) {
    if (possV.contains(v)) {
      possV.remove(v);
    }
  }

  return possV;
}

List<int> getGridValues(int row, int column, List<List<int>> sudoku) {
  List<int> gridValues = [];
  int startingRow = (row ~/ 3) * 3;
  int endingRow = ((row ~/ 3) + 1) * 3;
  int startingColumn = (column ~/ 3) * 3;
  int endingColumn = ((column ~/ 3) + 1) * 3;

  for (int i = startingRow; i < endingRow; ++i) {
    for (int j = startingColumn; j < endingColumn; ++j) {
      gridValues.add(sudoku[i][j]);
    }
  }

  return gridValues;
}

List<int> getRowValues(int row, List<List<int>> sudoku) {
  return List.from(sudoku[row]);
}

List<int> getColumnValues(int column, List<List<int>> sudoku) {
  List<int> columnValues = [];
  for (int row = 0; row < 9; ++row) {
    columnValues.add(sudoku[row][column]);
  }

  return columnValues;
}

bool solve(List<List<int>> sudoku) {
  for (int i = 0; i < 9; ++i) {
    for (int j = 0; j < 9; ++j) {
      if (sudoku[i][j] != 0) continue;

      List<int> possV = getPossibleValues(i, j, sudoku);

      for (var possibleValue in possV) {
        sudoku[i][j] = possibleValue;

        if (solve(sudoku)) {
          return true;
        }

        sudoku[i][j] = 0;
      }
      return false;
    }
  }

  solvedSudoku = sudoku;

  return true;
}

List<List<int>> getSolvedSudoku(List<List<int>> sudoku) {
  solve(sudoku);
  return solvedSudoku;
}
