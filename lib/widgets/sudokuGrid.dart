import 'package:flutter/material.dart';
import 'package:sudoku/widgets/cell.dart';
import 'subGrid.dart';
import 'staticClass.dart';

class SudokuGrid extends StatelessWidget {
  const SudokuGrid(this.difficulty, {super.key});

  final String difficulty;

  @override
  Widget build(BuildContext context) {
    CellFunctions.getNewSudoku(difficulty);

    void goToHomeScreen() {
      Navigator.pop(context);
    }

    void resetSudoku() {
      showDialog(
          context: context,
          builder: (ctx) {
            return const AlertDialog(
                title: Text("Message"), content: Text("Sudoku is Correct"));
          });
      CellFunctions.resetSudoku();
    }

    void checkSudoku() {
      if (!CellFunctions.isSudokuFilled) {
        showDialog(
            context: context,
            builder: (ctx) {
              return const AlertDialog(
                  title: Text("Message"),
                  content: Text("Complete The Sudoku First."));
            });
        return;
      }

      if (!CellFunctions.isSudokuCorrect) {
        showDialog(
            context: context,
            builder: (ctx) {
              return const AlertDialog(
                  title: Text("Message"), content: Text("Sudoku is wrong"));
            });
      } else {
        resetSudoku();
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
          thisGridCells.add(CellFunctions.cells[i][j]);
        }
      }

      return thisGridCells;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Sudoku"),
        leading: IconButton(
          onPressed: goToHomeScreen,
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.menu,
                color: kColorScheme.onPrimary,
              ))
        ],
      ),
      backgroundColor: kColorScheme.secondaryContainer,
      body: Center(
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
      ),
    );
  }
}
