import 'package:flutter/material.dart';
import 'cell.dart';

class CellWidget extends StatefulWidget {
  CellWidget({super.key, required this.cell});

  final Cell cell;
  Color color = Colors.white;

  @override
  State<CellWidget> createState() {
    return _Cell();
  }
}

class _Cell extends State<CellWidget> {
  void onCellClick() {
    setState(() {
      if (widget.cell.cellValue != 9) {
        widget.cell.cellValue++;
      } else {
        widget.cell.cellValue = 0;
      }
    });
  }

  void colorChange() {
    setState(() {
      widget.color = Colors.red;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.cell.disabled ? null : onCellClick,
      child: Container(
        child: Text(
          widget.cell.cellValue == 0 ? "" : widget.cell.cellValue.toString(),
          textAlign: TextAlign.center,
          style: TextStyle(color: widget.color),
        ),
      ),
    );
  }
}
