import 'package:flutter/material.dart';
import 'package:sudoku/widgets/cell.dart';

class SubGrid extends StatelessWidget {
  const SubGrid(this.thisGridCells, {super.key});

  final List<Cell> thisGridCells;

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Container(
        decoration:
            BoxDecoration(border: Border.all(color: Colors.black, width: 2)),
        child: GridView.count(
            padding: EdgeInsets.all(2),
            crossAxisCount: 3,
            children: thisGridCells),
      ),
    );
  }
}
