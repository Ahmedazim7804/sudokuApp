import 'package:flutter/material.dart';
import 'package:sudoku/widgets/cell.dart';

class SubGrid extends StatelessWidget {
  const SubGrid(this.thisGridCells, this.gridNumber, {super.key});

  final List<Cell> thisGridCells;
  final int gridNumber;

  @override
  Widget build(BuildContext context) {
    BorderSide left = BorderSide(width: gridNumber % 3 > 0 ? 2 : 0);
    BorderSide top = BorderSide(width: gridNumber ~/ 3 > 0 ? 2 : 0);
    BorderSide right = BorderSide(width: gridNumber % 3 < 2 ? 2 : 0);
    BorderSide bottom = BorderSide(width: gridNumber ~/ 3 < 2 ? 2 : 0);

    BoxDecoration decoration = BoxDecoration(
        border: Border(left: left, top: top, right: right, bottom: bottom),
        borderRadius: const BorderRadius.all(Radius.circular(6)));

    return GridTile(
      child: Container(
        decoration: decoration,
        child: GridView.count(
            padding: const EdgeInsets.all(2),
            crossAxisCount: 3,
            children: thisGridCells),
      ),
    );
  }
}
