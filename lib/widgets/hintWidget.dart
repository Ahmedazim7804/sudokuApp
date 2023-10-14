import 'package:flutter/material.dart';
import 'package:sudoku/model/model.dart';

class HintWidget extends StatefulWidget {
  const HintWidget({super.key});

  @override
  State<HintWidget> createState() => _HintWidgetState();
}

class _HintWidgetState extends State<HintWidget> {
  int hintsTaken = 0;

  void getHint() {
    CellFunctions.getHint();
    setState(() {
      hintsTaken++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
            onPressed: hintsTaken == 3 ? null : getHint,
            icon: Image.asset(
              "assets/hint_$hintsTaken.png",
              height: 44,
              width: 44,
            ))
      ],
    );
  }
}
