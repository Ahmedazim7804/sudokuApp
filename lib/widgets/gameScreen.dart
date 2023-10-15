import 'package:flutter/material.dart';
import 'package:sudoku/widgets/cell.dart';
import 'package:sudoku/widgets/hintWidget.dart';
import 'package:sudoku/widgets/sudokuGrid.dart';
import 'package:sudoku/widgets/timerWidget.dart';
import 'package:sudoku/widgets/valueAddWidget.dart';
import 'aboutScreen.dart';
import '../model/model.dart';

class GameScreen extends StatelessWidget {
  GameScreen(this.difficulty, {super.key});

  final String difficulty;
  final GlobalKey<TimerWidgetState> timerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
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
      timerKey.currentState?.stopTimer();
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

    return FutureBuilder(
        future: CellFunctions.getNewSudoku(difficulty),
        builder: (context, snapshot) {
          if (ConnectionState.done == snapshot.connectionState) {
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
                    TimerWidget(
                      key: timerKey,
                    ),
                    const HintWidget(),
                    const SudokuGrid(),
                    const InputValueWidget(),
                    ElevatedButton(
                        onPressed: checkSudoku,
                        child: const Text("Check Sudoku")),
                  ],
                ),
              ),
            );
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}
