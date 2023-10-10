import 'package:flutter/material.dart';
import 'staticClass.dart';

ColorScheme kColorScheme = ColorScheme.fromSeed(
    seedColor: Color.fromARGB(255, 140, 1, 248), brightness: Brightness.dark);

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
  Color color = kColorScheme.onSecondaryContainer.withAlpha(120);
  final int column;
  Function updateCellValue = () {};

  @override
  State<Cell> createState() {
    return _Cell();
  }
}

class _Cell extends State<Cell> {
  void updateCellValue(int value) {
    setState(() {
      widget.disabled = value != 0 ? true : false;
      widget.cellValue = value;
    });
  }

  void changeColor() {
    if (!CellFunctions.isCellCorrect(
        CellFunctions.cells[widget.row][widget.column])) {
      widget.color = const Color.fromARGB(120, 244, 67, 54);
    } else {
      widget.color =
          Theme.of(context).colorScheme.onSecondaryContainer.withAlpha(120);
    }
  }

  void onCellClick() {
    setState(() {
      if (widget.cellValue != 9) {
        widget.cellValue++;
        changeColor();
      } else {
        widget.cellValue = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    widget.updateCellValue = updateCellValue;

    return GestureDetector(
      onTap: widget.disabled ? null : onCellClick,
      child: Card(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              shape: BoxShape.rectangle,
              color: widget.color),
          alignment: Alignment.center,
          child: Text(
            widget.cellValue == 0 ? "" : widget.cellValue.toString(),
            style: TextStyle(color: widget.color),
          ),
        ),
      ),
    );
  }
}
