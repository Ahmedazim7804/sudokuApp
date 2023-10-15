import 'package:flutter/material.dart';
import 'package:sudoku/widgets/cell.dart';
import 'package:sudoku/widgets/hintWidget.dart';
import 'package:sudoku/widgets/leaderboardScreen.dart';
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
    final Widget timer = TimerWidget(key: timerKey);
    final nameTextFieldController = TextEditingController();

    void addRecord() {}

    void addRecordDialog() {
      showDialog(
          context: context,
          builder: (BuildContext ctx) {
            return Dialog(
                backgroundColor: Theme.of(context).colorScheme.background,
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: nameTextFieldController,
                        maxLength: 20,
                        decoration: const InputDecoration(
                          label: Text("Name"),
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("Cancel")),
                          ElevatedButton(
                              onPressed: addRecord, child: const Text("Add")),
                        ],
                      ),
                    ],
                  ),
                ));
          });
    }

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
      return AlertDialog(
        title: const Text(
          "YOU WON",
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: const Image(image: AssetImage('assets/trophy.png')),
        actions: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: addRecordDialog,
                    child: const Text("Add Record")),
                TextButton(onPressed: () {}, child: const Text("Homescreen")),
              ],
            ),
          )
        ],
      );
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
              ),
            );
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
                    timer,
                    HintWidget(),
                    const SudokuGrid(),
                    const MyWidget(),
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
