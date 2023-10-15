import 'package:flutter/material.dart';
import 'package:sudoku/model/model.dart';

class InputValueWidget extends StatelessWidget {
  const InputValueWidget({super.key});

  static int row = -1;
  static int column = -1;
  static int previousRow = -1;
  static int previousColumn = -1;

  static void selectCell(int newRow, int newColumn) {
    previousRow = row;
    previousColumn = column;
    row = newRow;
    column = newColumn;
  }

  static unselectPreviousCell() {
    CellFunctions.cells[previousRow][previousColumn].unselectThisCell();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
            5,
            (index) => ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(), elevation: 3),
                onPressed: () {
                  if (row != -1) {
                    CellFunctions.cells[row][column].updateCellValue(index);
                  }
                },
                child: Text(index.toString())),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
            5,
            (index) => ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(), elevation: 3),
                onPressed: () {
                  if (row != -1) {
                    CellFunctions.cells[row][column].updateCellValue(index + 5);
                  }
                },
                child: Text((index + 5).toString())),
          ),
        ),
      ],
    );
  }
}
