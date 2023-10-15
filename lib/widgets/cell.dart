import 'package:flutter/material.dart';
import '../model/model.dart';
import 'valueAddWidget.dart';

ColorScheme colorScheme = ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 140, 1, 248),
    brightness: Brightness.dark);

class Cell extends StatefulWidget {
  Cell({
    super.key,
    required this.cellValue,
    required this.disabled,
    required this.row,
    required this.column,
  });

  bool disabled;
  int cellValue;
  final int row;
  Color color = colorScheme.onSecondaryContainer.withAlpha(120);
  final int column;
  Function updateCellValue = () {};
  Function updateDisabledValue = () {};
  Function unselectThisCell = () {};

  @override
  State<Cell> createState() {
    return _Cell();
  }
}

class _Cell extends State<Cell> {
  void updateCellValue(int value) {
    setState(() {
      widget.cellValue = value;
      changeColorIfIncorrect();
    });
  }

  void updateDisabledValue() {
    widget.disabled = widget.cellValue != 0 ? true : false;
  }

  void changeColorIfIncorrect() {
    if (CellFunctions.cells[widget.row][widget.column].cellValue == 0) {
      widget.color =
          Theme.of(context).colorScheme.onSecondaryContainer.withAlpha(120);
    } else if (!CellFunctions.isCellCorrect(
        CellFunctions.cells[widget.row][widget.column])) {
      widget.color = const Color.fromARGB(120, 244, 67, 54);
    } else {
      widget.color =
          Theme.of(context).colorScheme.onSecondaryContainer.withAlpha(120);
    }
  }

  void selectThisCell() {
    InputValueWidget.selectCell(widget.row, widget.column);
    InputValueWidget.unselectPreviousCell();
    setState(() {
      widget.color = Colors.white;
    });
  }

  void unselectThisCell() {
    setState(() {
      changeColorIfIncorrect();
    });
  }

  @override
  Widget build(BuildContext context) {
    widget.updateCellValue = updateCellValue;
    widget.updateDisabledValue = updateDisabledValue;
    widget.unselectThisCell = unselectThisCell;

    return GestureDetector(
      onTap: widget.disabled ? null : selectThisCell,
      child: Card(
        elevation: 10,
        color: widget.color,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            shape: BoxShape.rectangle,
          ),
          alignment: Alignment.center,
          child: Text(
            widget.cellValue == 0 ? "" : widget.cellValue.toString(),
            style: TextStyle(
                color: widget.disabled ? Colors.black : Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
