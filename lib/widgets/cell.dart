import 'package:flutter/material.dart';
import '../model/model.dart';

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

  void _showMenu() {
    showDialog(
        context: context,
        builder: (ctx) {
          return Dialog(
            backgroundColor: Colors.transparent,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(
                      5,
                      (index) => Expanded(
                            child: TextButton(
                                onPressed: () {
                                  updateCellValue(index);
                                  Navigator.pop(context);
                                },
                                child: Text(index.toString())),
                          )),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(
                      5,
                      (index) => Expanded(
                            child: TextButton(
                                onPressed: () {
                                  updateCellValue(index + 5);
                                  Navigator.pop(context);
                                },
                                child: Text((index + 5).toString())),
                          )),
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    widget.updateCellValue = updateCellValue;
    widget.updateDisabledValue = updateDisabledValue;

    return GestureDetector(
      onTap: widget.disabled ? null : _showMenu,
      child: Card(
        color: Theme.of(context).colorScheme.primary.withAlpha(150),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              shape: BoxShape.rectangle,
              color: widget.color),
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
