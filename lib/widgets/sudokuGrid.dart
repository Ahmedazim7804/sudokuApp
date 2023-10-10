import 'package:flutter/material.dart';
import 'package:sudoku/widgets/cell.dart';
import 'subGrid.dart';
import 'aboutScreen.dart';
import '../model/model.dart';

class SudokuGrid extends StatelessWidget {
  const SudokuGrid(this.difficulty, {super.key});

  final String difficulty;

  @override
  Widget build(BuildContext context) {
    CellFunctions.getNewSudoku(difficulty);

    void goToHomeScreen() {
      Navigator.pop(context);
    }

    void goToinfoScreen() {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const AboutScreen()));
    }

    void wrongSolutionDialog() {
      showDialog(
          context: context,
          builder: (ctx) {
            return const AlertDialog(
              title: Image(image: AssetImage("assets/sorry.png")),
              content: Text(
                "Your Solution is Incorrect\nPlease Try Again",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                textAlign: TextAlign.center,
              ),
            );
          });
    }

    AlertDialog correctSolutionDialog() {
      return const AlertDialog(
          title: Text(
            "YOU WON",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Image(image: AssetImage('assets/trophy.png')));
    }

    void incompleteSolutionDialog() {
      showDialog(
          context: context,
          builder: (ctx) {
            return const AlertDialog(
                title: Text("Bro"),
                content: Text(
                  "Complete The Sudoku First.",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ));
          });
    }

    void solutionIsCorrect() async {
      await showDialog(
          context: context,
          builder: (ctx) {
            return correctSolutionDialog();
          });
      goToHomeScreen();
    }

    void checkSudoku() {
      if (!CellFunctions.isSudokuFilled) {
        incompleteSolutionDialog();
        return;
      }

      if (!CellFunctions.isSudokuCorrect) {
        wrongSolutionDialog();
      } else {
        solutionIsCorrect();
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
              onPressed: goToinfoScreen,
              icon: Icon(
                Icons.info,
                color: colorScheme.onPrimary,
              ))
        ],
      ),
      backgroundColor: colorScheme.secondaryContainer,
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
