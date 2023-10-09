import 'package:flutter/material.dart';

ValueNotifier<List<bool>> hasErrors =
    ValueNotifier(List.generate(81, (index) => false));

class Cell extends StatefulWidget {
  Cell({
    super.key,
    required this.cellValue,
    required this.disabled,
    required this.row,
    this.hasError = false,
    required this.column,
  });

  final bool disabled;
  int cellValue;
  final int row;
  bool hasError;
  final int column;

  @override
  State<Cell> createState() {
    return _Cell();
  }
}

class _Cell extends State<Cell> {
  void onCellClick() {
    setState(() {
      if (widget.cellValue != 9) {
        widget.cellValue++;
      } else {
        widget.cellValue = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.disabled ? null : onCellClick,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            shape: BoxShape.rectangle,
            color: Theme.of(context)
                .colorScheme
                .onSecondaryContainer
                .withAlpha(50)),
        alignment: Alignment.center,
        child: Text(
          widget.cellValue == 0 ? "" : widget.cellValue.toString(),
        ),
      ),
    );
  }
}
