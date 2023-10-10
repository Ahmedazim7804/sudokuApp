import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/cell.dart';
import 'dart:math';
import 'dart:convert';
import 'dart:io';

class CellFunctions {
  static Map<String, List<List<int>>> listOfSudokus = {
    "easy": [
      [
        7,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        5,
        0,
        0,
        0,
        0,
        0,
        0,
        6,
        1,
        2,
        0,
        0,
        0,
        0,
        0,
        5,
        0,
        0,
        0,
        2,
        8,
        0,
        0,
        5,
        0,
        3,
        0,
        0,
        7,
        0,
        6,
        0,
        4,
        0,
        1,
        0,
        0,
        6,
        0,
        0,
        3,
        0,
        4,
        0,
        7,
        0,
        0,
        0,
        0,
        0,
        8,
        3,
        0,
        0,
        6,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        2,
        0,
        0,
        4,
        0,
        1,
        0,
        0,
        7,
        0
      ],
      [
        0,
        3,
        1,
        0,
        0,
        0,
        0,
        4,
        0,
        0,
        0,
        0,
        6,
        8,
        0,
        0,
        0,
        5,
        0,
        0,
        0,
        7,
        0,
        1,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        7,
        0,
        0,
        0,
        0,
        0,
        8,
        5,
        1,
        0,
        0,
        2,
        6,
        0,
        0,
        0,
        0,
        4,
        0,
        0,
        8,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        7,
        3,
        0,
        0,
        4,
        0,
        0,
        8,
        0,
        0,
        2,
        0,
        1,
        0,
        0,
        5,
        2,
        4,
        0,
        0
      ],
      [
        1,
        0,
        0,
        6,
        7,
        0,
        3,
        0,
        2,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        8,
        0,
        0,
        8,
        7,
        9,
        0,
        0,
        0,
        0,
        0,
        0,
        5,
        0,
        7,
        1,
        0,
        9,
        0,
        0,
        0,
        7,
        9,
        5,
        0,
        2,
        0,
        0,
        3,
        0,
        0,
        0,
        0,
        6,
        0,
        0,
        0,
        0,
        8,
        1,
        0,
        0,
        0,
        0,
        0,
        2,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        6,
        9,
        0,
        0,
        0,
        0,
        0,
        5,
        0,
        0,
        0,
        0
      ],
      [
        0,
        0,
        0,
        0,
        0,
        8,
        0,
        4,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        8,
        0,
        4,
        1,
        0,
        0,
        0,
        0,
        0,
        2,
        7,
        0,
        0,
        8,
        1,
        0,
        4,
        0,
        9,
        0,
        6,
        2,
        0,
        0,
        7,
        8,
        0,
        3,
        4,
        0,
        0,
        0,
        0,
        6,
        6,
        0,
        4,
        0,
        0,
        7,
        2,
        8,
        9,
        2,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        7,
        9,
        0,
        6,
        0,
        0,
        1
      ],
      [
        0,
        0,
        1,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        9,
        0,
        7,
        0,
        9,
        3,
        0,
        0,
        0,
        0,
        0,
        6,
        0,
        0,
        0,
        0,
        3,
        0,
        1,
        0,
        2,
        0,
        7,
        0,
        2,
        8,
        0,
        0,
        0,
        0,
        6,
        0,
        0,
        0,
        0,
        0,
        5,
        0,
        9,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        2,
        0,
        0,
        8,
        1,
        9,
        2,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        6,
        0,
        0,
        3,
        1,
        0
      ],
      [
        0,
        0,
        0,
        6,
        3,
        0,
        8,
        2,
        0,
        2,
        0,
        3,
        0,
        1,
        0,
        5,
        6,
        0,
        0,
        9,
        0,
        0,
        0,
        0,
        4,
        0,
        0,
        0,
        6,
        8,
        3,
        9,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        5,
        0,
        0,
        0,
        0,
        4,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        4,
        0,
        0,
        0,
        0,
        0,
        6,
        5,
        2,
        0,
        0,
        0,
        0,
        9,
        0,
        9,
        0,
        0,
        0,
        0,
        6,
        0,
        3,
        0
      ],
      [
        0,
        0,
        0,
        0,
        0,
        5,
        0,
        0,
        0,
        4,
        0,
        0,
        3,
        7,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        6,
        2,
        4,
        0,
        7,
        8,
        4,
        0,
        7,
        0,
        9,
        0,
        0,
        6,
        0,
        0,
        3,
        0,
        2,
        4,
        7,
        0,
        0,
        0,
        5,
        0,
        0,
        0,
        6,
        9,
        0,
        0,
        0,
        0,
        0,
        9,
        5,
        3,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        8,
        0,
        4,
        0,
        0,
        0,
        0,
        0,
        0,
        6,
        9,
        0
      ],
      [
        9,
        8,
        0,
        0,
        3,
        0,
        7,
        0,
        0,
        0,
        0,
        0,
        0,
        5,
        0,
        0,
        8,
        4,
        0,
        0,
        4,
        9,
        0,
        0,
        0,
        5,
        0,
        0,
        0,
        0,
        0,
        7,
        0,
        1,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        1,
        0,
        3,
        0,
        0,
        0,
        0,
        0,
        2,
        7,
        0,
        8,
        0,
        0,
        5,
        0,
        0,
        0,
        0,
        0,
        9,
        0,
        1,
        0,
        3,
        0,
        8,
        0,
        4,
        0,
        7,
        2,
        0,
        5,
        0,
        0
      ],
      [
        0,
        0,
        8,
        7,
        0,
        0,
        0,
        1,
        0,
        0,
        1,
        4,
        0,
        0,
        0,
        0,
        0,
        3,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        5,
        7,
        2,
        0,
        0,
        5,
        3,
        0,
        0,
        0,
        0,
        0,
        1,
        0,
        0,
        2,
        0,
        0,
        0,
        0,
        0,
        3,
        0,
        0,
        8,
        0,
        0,
        4,
        0,
        0,
        0,
        0,
        8,
        0,
        0,
        0,
        0,
        8,
        7,
        0,
        0,
        0,
        0,
        4,
        0,
        0,
        9,
        0,
        0,
        0,
        0,
        0,
        0,
        3,
        2
      ],
      [
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        4,
        8,
        0,
        0,
        0,
        0,
        2,
        6,
        0,
        0,
        0,
        2,
        0,
        0,
        4,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        6,
        0,
        5,
        0,
        0,
        9,
        0,
        0,
        0,
        0,
        1,
        0,
        0,
        6,
        3,
        0,
        0,
        0,
        0,
        9,
        0,
        8,
        0,
        0,
        0,
        4,
        0,
        3,
        0,
        9,
        0,
        1,
        6,
        3,
        0,
        6,
        0,
        0,
        0,
        0,
        2,
        0,
        0,
        9,
        5,
        0,
        0,
        2,
        0,
        0,
        0
      ],
      [
        0,
        5,
        0,
        0,
        0,
        0,
        9,
        0,
        0,
        4,
        1,
        0,
        0,
        0,
        0,
        0,
        8,
        0,
        0,
        0,
        0,
        0,
        9,
        3,
        0,
        4,
        2,
        0,
        0,
        2,
        0,
        3,
        9,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        5,
        0,
        2,
        0,
        0,
        0,
        8,
        2,
        0,
        0,
        7,
        0,
        0,
        3,
        0,
        0,
        0,
        0,
        4,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        1,
        0,
        0,
        0,
        0,
        0,
        9,
        1,
        0,
        0,
        8,
        5,
        0,
        0
      ],
      [
        0,
        8,
        0,
        0,
        0,
        6,
        9,
        0,
        0,
        0,
        0,
        0,
        4,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        3,
        9,
        2,
        0,
        0,
        1,
        0,
        0,
        0,
        1,
        0,
        0,
        3,
        0,
        0,
        0,
        3,
        0,
        7,
        0,
        0,
        0,
        8,
        0,
        8,
        4,
        0,
        0,
        0,
        0,
        1,
        0,
        6,
        0,
        6,
        0,
        0,
        0,
        1,
        0,
        4,
        3,
        7,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        9,
        0,
        3,
        0,
        0,
        0
      ],
      [
        0,
        0,
        0,
        6,
        0,
        0,
        2,
        0,
        0,
        0,
        0,
        3,
        0,
        0,
        8,
        0,
        0,
        1,
        5,
        4,
        0,
        0,
        0,
        0,
        0,
        8,
        0,
        0,
        6,
        0,
        7,
        3,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        4,
        5,
        7,
        0,
        0,
        2,
        0,
        0,
        0,
        0,
        1,
        0,
        4,
        3,
        0,
        8,
        0,
        5,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        1,
        0,
        0,
        0,
        0,
        0,
        0,
        6,
        0,
        0,
        0,
        0,
        0,
        0,
        5,
        4
      ],
      [
        6,
        4,
        3,
        0,
        7,
        0,
        0,
        0,
        0,
        0,
        2,
        0,
        0,
        0,
        5,
        0,
        0,
        0,
        0,
        0,
        0,
        3,
        0,
        0,
        0,
        0,
        0,
        1,
        0,
        4,
        0,
        0,
        2,
        0,
        0,
        0,
        2,
        0,
        0,
        0,
        1,
        0,
        8,
        0,
        0,
        5,
        0,
        0,
        6,
        0,
        0,
        0,
        3,
        1,
        0,
        0,
        0,
        0,
        6,
        0,
        0,
        0,
        3,
        0,
        6,
        0,
        8,
        4,
        0,
        0,
        0,
        5,
        3,
        0,
        1,
        0,
        0,
        0,
        0,
        8,
        0
      ],
      [
        0,
        0,
        0,
        5,
        2,
        0,
        4,
        0,
        0,
        0,
        0,
        0,
        0,
        9,
        0,
        1,
        0,
        2,
        0,
        0,
        0,
        8,
        0,
        1,
        0,
        5,
        0,
        0,
        0,
        0,
        9,
        0,
        0,
        0,
        7,
        0,
        0,
        1,
        0,
        0,
        0,
        0,
        6,
        8,
        0,
        8,
        0,
        7,
        4,
        5,
        0,
        0,
        0,
        0,
        0,
        2,
        0,
        1,
        0,
        4,
        9,
        0,
        0,
        0,
        0,
        6,
        0,
        8,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        9,
        0,
        2,
        0
      ],
      [
        6,
        0,
        0,
        8,
        0,
        1,
        0,
        0,
        5,
        0,
        0,
        9,
        7,
        0,
        0,
        0,
        0,
        0,
        0,
        2,
        8,
        0,
        6,
        4,
        0,
        1,
        0,
        0,
        9,
        7,
        0,
        0,
        5,
        0,
        0,
        0,
        0,
        0,
        1,
        0,
        0,
        7,
        0,
        4,
        0,
        5,
        4,
        0,
        0,
        0,
        0,
        0,
        6,
        0,
        0,
        0,
        2,
        0,
        0,
        9,
        0,
        0,
        0,
        0,
        7,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        4,
        0,
        8,
        0,
        9,
        0
      ],
      [
        0,
        0,
        1,
        4,
        0,
        7,
        0,
        0,
        3,
        6,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        7,
        0,
        3,
        6,
        1,
        0,
        8,
        4,
        0,
        0,
        0,
        0,
        2,
        0,
        0,
        0,
        0,
        0,
        0,
        1,
        5,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        3,
        7,
        0,
        0,
        0,
        0,
        6,
        0,
        0,
        4,
        5,
        2,
        0,
        8,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        1,
        0,
        0,
        0,
        8,
        0,
        5,
        0,
        0,
        4
      ],
      [
        1,
        0,
        0,
        0,
        0,
        0,
        0,
        7,
        9,
        0,
        0,
        8,
        0,
        0,
        0,
        0,
        0,
        0,
        3,
        0,
        0,
        4,
        1,
        0,
        0,
        0,
        0,
        0,
        0,
        1,
        8,
        0,
        0,
        6,
        0,
        7,
        4,
        0,
        0,
        1,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        2,
        9,
        0,
        4,
        0,
        0,
        0,
        7,
        0,
        3,
        0,
        0,
        0,
        0,
        0,
        8,
        2,
        0,
        0,
        0,
        0,
        0,
        0,
        1,
        6,
        0,
        0,
        0,
        0,
        0,
        8,
        9,
        2,
        0
      ],
      [
        8,
        6,
        0,
        3,
        9,
        4,
        0,
        0,
        0,
        7,
        0,
        5,
        0,
        8,
        0,
        0,
        0,
        0,
        4,
        0,
        0,
        2,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        8,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        6,
        7,
        0,
        0,
        4,
        0,
        0,
        0,
        2,
        0,
        9,
        0,
        0,
        6,
        3,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        5,
        8,
        0,
        0,
        0,
        0,
        0,
        0,
        7,
        0,
        9,
        0,
        0,
        0,
        0,
        6,
        0,
        2,
        0,
        0
      ]
    ],
    "medium": [
      [
        0,
        0,
        0,
        0,
        0,
        1,
        2,
        0,
        8,
        0,
        8,
        6,
        0,
        0,
        5,
        0,
        1,
        0,
        0,
        0,
        3,
        0,
        0,
        2,
        0,
        0,
        0,
        4,
        0,
        0,
        1,
        0,
        0,
        0,
        0,
        9,
        0,
        0,
        9,
        5,
        0,
        0,
        0,
        0,
        0,
        8,
        0,
        0,
        0,
        0,
        0,
        3,
        0,
        5,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        4,
        1,
        8,
        0,
        0,
        0,
        0,
        0,
        5,
        0,
        8,
        4,
        6,
        3,
        0,
        0,
        0
      ],
      [
        0,
        0,
        0,
        4,
        0,
        1,
        0,
        3,
        0,
        0,
        0,
        7,
        0,
        0,
        6,
        0,
        0,
        2,
        0,
        0,
        0,
        3,
        2,
        0,
        0,
        4,
        0,
        2,
        0,
        8,
        7,
        0,
        0,
        9,
        0,
        0,
        0,
        6,
        0,
        0,
        8,
        0,
        2,
        0,
        1,
        0,
        0,
        3,
        0,
        0,
        0,
        8,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        7,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        6,
        0,
        0,
        0,
        0,
        0,
        1,
        0,
        0,
        4,
        8,
        0,
        9,
        0
      ],
      [
        0,
        0,
        2,
        0,
        9,
        5,
        8,
        0,
        0,
        7,
        3,
        0,
        0,
        6,
        8,
        0,
        0,
        1,
        5,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        3,
        0,
        0,
        0,
        1,
        0,
        0,
        5,
        7,
        0,
        7,
        0,
        0,
        0,
        0,
        2,
        0,
        0,
        0,
        2,
        0,
        3,
        0,
        0,
        0,
        0,
        9,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        1,
        5,
        0,
        6,
        0,
        0,
        0,
        0,
        3,
        0,
        0,
        0,
        0,
        8,
        0,
        0,
        0,
        7,
        6,
        2
      ],
      [
        0,
        0,
        5,
        0,
        3,
        0,
        0,
        6,
        7,
        9,
        0,
        0,
        0,
        6,
        5,
        0,
        0,
        2,
        1,
        6,
        0,
        4,
        0,
        0,
        3,
        5,
        0,
        0,
        0,
        0,
        0,
        9,
        6,
        0,
        0,
        4,
        0,
        0,
        0,
        0,
        0,
        7,
        0,
        0,
        6,
        0,
        0,
        0,
        1,
        0,
        3,
        0,
        0,
        0,
        0,
        9,
        7,
        0,
        1,
        0,
        0,
        0,
        0,
        0,
        4,
        0,
        0,
        0,
        0,
        0,
        7,
        0,
        0,
        0,
        1,
        0,
        0,
        4,
        0,
        0,
        0
      ],
      [
        5,
        0,
        6,
        0,
        0,
        4,
        2,
        7,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        8,
        3,
        0,
        9,
        0,
        2,
        7,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        8,
        2,
        0,
        0,
        0,
        0,
        4,
        0,
        0,
        0,
        0,
        9,
        7,
        0,
        0,
        0,
        0,
        0,
        3,
        0,
        0,
        0,
        0,
        0,
        0,
        3,
        0,
        0,
        0,
        0,
        9,
        0,
        0,
        0,
        0,
        0,
        0,
        8,
        4,
        2,
        0,
        0,
        0,
        0,
        6,
        5,
        9,
        0
      ],
      [
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        9,
        0,
        0,
        2,
        0,
        6,
        4,
        3,
        0,
        6,
        0,
        0,
        5,
        1,
        0,
        0,
        0,
        0,
        0,
        2,
        5,
        8,
        0,
        4,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        5,
        8,
        0,
        8,
        0,
        0,
        0,
        6,
        0,
        1,
        0,
        0,
        0,
        0,
        0,
        4,
        0,
        1,
        0,
        0,
        5,
        0,
        0,
        4,
        0,
        0,
        0,
        0,
        0,
        9,
        0,
        0,
        0,
        6,
        3,
        0,
        2,
        0,
        0
      ],
      [
        0,
        5,
        0,
        1,
        2,
        0,
        0,
        0,
        3,
        7,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        1,
        0,
        0,
        2,
        6,
        0,
        5,
        7,
        0,
        0,
        6,
        9,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        8,
        0,
        0,
        0,
        7,
        0,
        0,
        5,
        0,
        0,
        0,
        7,
        0,
        3,
        0,
        0,
        0,
        9,
        0,
        0,
        0,
        2,
        0,
        1,
        0,
        0,
        0,
        0,
        0,
        3,
        9,
        8,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        6
      ],
      [
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        8,
        0,
        4,
        6,
        3,
        0,
        0,
        0,
        1,
        9,
        0,
        5,
        0,
        0,
        0,
        0,
        5,
        3,
        0,
        0,
        0,
        0,
        0,
        0,
        1,
        0,
        0,
        4,
        0,
        9,
        0,
        5,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        8,
        0,
        1,
        0,
        0,
        0,
        0,
        0,
        8,
        0,
        0,
        7,
        3,
        8,
        0,
        0,
        0,
        1,
        4,
        0,
        0,
        4,
        0,
        0,
        0,
        9,
        7,
        0,
        0
      ],
      [
        0,
        0,
        0,
        0,
        8,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        9,
        0,
        5,
        4,
        0,
        0,
        0,
        0,
        0,
        4,
        0,
        6,
        2,
        0,
        0,
        6,
        0,
        0,
        2,
        0,
        0,
        0,
        0,
        9,
        0,
        2,
        0,
        5,
        4,
        0,
        0,
        0,
        8,
        0,
        5,
        0,
        0,
        3,
        0,
        0,
        4,
        0,
        7,
        0,
        0,
        0,
        0,
        0,
        0,
        5,
        0,
        0,
        3,
        0,
        0,
        6,
        0,
        0,
        7,
        0,
        0,
        0,
        8,
        0,
        0,
        0,
        6,
        0,
        0
      ],
      [
        5,
        0,
        0,
        3,
        0,
        0,
        0,
        0,
        4,
        0,
        0,
        7,
        0,
        0,
        4,
        0,
        0,
        6,
        6,
        0,
        8,
        0,
        1,
        0,
        0,
        0,
        7,
        0,
        3,
        0,
        4,
        5,
        0,
        0,
        6,
        9,
        7,
        0,
        0,
        0,
        3,
        0,
        0,
        4,
        0,
        0,
        0,
        0,
        0,
        7,
        6,
        0,
        3,
        1,
        0,
        1,
        0,
        0,
        0,
        5,
        0,
        0,
        0,
        4,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        3,
        0,
        0,
        0,
        1,
        0,
        0
      ]
    ],
    "hard": [
      [
        0,
        9,
        0,
        0,
        0,
        0,
        0,
        4,
        0,
        0,
        4,
        2,
        7,
        0,
        3,
        0,
        8,
        6,
        5,
        0,
        0,
        0,
        0,
        6,
        0,
        0,
        9,
        0,
        6,
        4,
        0,
        0,
        7,
        0,
        3,
        0,
        0,
        0,
        3,
        0,
        8,
        5,
        9,
        0,
        0,
        0,
        0,
        0,
        3,
        0,
        0,
        0,
        0,
        7,
        0,
        0,
        9,
        0,
        0,
        0,
        6,
        0,
        0,
        0,
        0,
        8,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        9,
        0,
        5,
        3
      ],
      [
        0,
        3,
        0,
        0,
        0,
        0,
        0,
        0,
        4,
        1,
        0,
        7,
        0,
        0,
        9,
        2,
        0,
        0,
        0,
        5,
        0,
        0,
        1,
        0,
        6,
        0,
        0,
        5,
        0,
        0,
        3,
        7,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        4,
        1,
        0,
        0,
        0,
        9,
        0,
        0,
        0,
        2,
        6,
        0,
        0,
        7,
        0,
        0,
        0,
        0,
        0,
        0,
        1,
        5,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        4,
        0,
        0,
        0,
        6,
        0,
        9,
        0,
        3,
        0,
        0
      ],
      [
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        6,
        0,
        0,
        1,
        2,
        7,
        5,
        0,
        0,
        0,
        0,
        0,
        7,
        9,
        0,
        8,
        5,
        0,
        0,
        9,
        0,
        0,
        0,
        0,
        0,
        0,
        8,
        0,
        0,
        1,
        0,
        0,
        0,
        3,
        0,
        7,
        0,
        0,
        2,
        0,
        6,
        0,
        9,
        1,
        6,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        2,
        0,
        0,
        0,
        8,
        1,
        0,
        9,
        3,
        7,
        0,
        0,
        0,
        0,
        0,
        0
      ],
      [
        0,
        0,
        3,
        0,
        0,
        9,
        0,
        0,
        4,
        0,
        0,
        0,
        4,
        0,
        5,
        1,
        0,
        0,
        2,
        0,
        6,
        1,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        1,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        3,
        0,
        0,
        0,
        0,
        2,
        0,
        6,
        5,
        0,
        4,
        3,
        0,
        2,
        0,
        9,
        1,
        0,
        0,
        0,
        5,
        0,
        0,
        0,
        0,
        0,
        0,
        7,
        0,
        9,
        0,
        0,
        0,
        0,
        3,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        7,
        0
      ],
      [
        8,
        0,
        0,
        0,
        0,
        4,
        0,
        3,
        0,
        0,
        0,
        0,
        5,
        9,
        3,
        0,
        0,
        0,
        0,
        0,
        0,
        8,
        0,
        0,
        0,
        0,
        6,
        0,
        3,
        0,
        0,
        0,
        2,
        0,
        0,
        8,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        6,
        0,
        2,
        0,
        7,
        4,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        4,
        0,
        0,
        5,
        0,
        0,
        0,
        5,
        0,
        0,
        2,
        0,
        0,
        0,
        0,
        7,
        6,
        8,
        0,
        0,
        3,
        0,
        0,
        5,
        2
      ],
      [
        0,
        3,
        0,
        1,
        4,
        0,
        0,
        2,
        0,
        0,
        0,
        0,
        6,
        0,
        0,
        0,
        5,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        6,
        0,
        3,
        0,
        0,
        0,
        0,
        2,
        9,
        0,
        7,
        0,
        0,
        0,
        0,
        4,
        0,
        6,
        9,
        0,
        0,
        6,
        0,
        9,
        7,
        0,
        0,
        3,
        4,
        0,
        0,
        0,
        5,
        0,
        0,
        0,
        2,
        0,
        4,
        0,
        0,
        0,
        0,
        1,
        0,
        5,
        3,
        0,
        3,
        0,
        0,
        5,
        0,
        0,
        0,
        6,
        7
      ],
      [
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        8,
        6,
        0,
        0,
        0,
        8,
        5,
        0,
        0,
        2,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        2,
        0,
        0,
        3,
        0,
        0,
        0,
        5,
        4,
        0,
        6,
        0,
        0,
        0,
        2,
        3,
        1,
        0,
        0,
        1,
        0,
        0,
        4,
        5,
        0,
        0,
        0,
        5,
        0,
        6,
        0,
        0,
        3,
        9,
        4,
        0,
        1,
        9,
        0,
        4,
        0,
        0,
        2,
        0,
        0,
        0,
        0,
        3,
        0,
        0,
        0,
        0,
        0,
        0
      ],
      [
        0,
        0,
        0,
        0,
        0,
        0,
        8,
        0,
        4,
        4,
        0,
        5,
        0,
        2,
        0,
        0,
        9,
        6,
        0,
        0,
        0,
        0,
        8,
        0,
        0,
        2,
        0,
        9,
        0,
        0,
        0,
        6,
        0,
        5,
        0,
        1,
        0,
        0,
        1,
        2,
        0,
        0,
        4,
        6,
        0,
        0,
        0,
        0,
        0,
        0,
        9,
        0,
        0,
        0,
        3,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        8,
        9,
        2,
        0,
        0,
        0,
        0,
        0,
        0,
        6,
        5,
        0,
        0,
        0,
        0,
        2,
        0,
        3
      ],
      [
        0,
        0,
        0,
        0,
        7,
        0,
        0,
        0,
        0,
        0,
        8,
        0,
        0,
        0,
        6,
        0,
        0,
        9,
        0,
        0,
        0,
        4,
        0,
        9,
        7,
        0,
        8,
        0,
        9,
        2,
        0,
        0,
        0,
        0,
        8,
        0,
        7,
        0,
        6,
        0,
        0,
        8,
        3,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        5,
        4,
        0,
        0,
        0,
        0,
        0,
        5,
        7,
        0,
        0,
        7,
        9,
        0,
        3,
        0,
        6,
        0,
        0,
        0,
        0,
        3,
        0,
        0,
        0,
        0,
        0,
        0
      ],
      [
        3,
        7,
        0,
        0,
        0,
        0,
        0,
        2,
        0,
        0,
        0,
        8,
        2,
        6,
        0,
        1,
        3,
        0,
        0,
        0,
        0,
        0,
        0,
        4,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        4,
        6,
        6,
        4,
        0,
        0,
        0,
        9,
        0,
        1,
        2,
        0,
        2,
        0,
        0,
        0,
        7,
        0,
        9,
        0,
        0,
        0,
        3,
        0,
        0,
        0,
        0,
        0,
        0,
        2,
        0,
        1,
        4,
        0,
        0,
        0,
        0,
        0,
        0,
        8,
        0,
        0,
        9,
        0,
        0,
        0,
        0
      ]
    ]
  };

  static final List<List<Cell>> cells = [[], [], [], [], [], [], [], [], []];

  static final List<List<int>> board = [
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0]
  ];

  static void createAllCells(List<List<int>> board) {
    for (int i = 0; i < 9; i++) {
      for (int j = 0; j < 9; j++) {
        cells[i].add(Cell(
            cellValue: board[i][j],
            disabled: board[i][j] != 0 ? true : false,
            row: i,
            column: j));
      }
    }
  }

  static void updateAllCells(List<List<int>> board) {
    for (int i = 0; i < 9; i++) {
      for (int j = 0; j < 9; j++) {
        cells[i][j] = Cell(
            cellValue: board[i][j],
            disabled: board[i][j] != 0 ? true : false,
            row: i,
            column: j);
      }
    }
  }

  static void readSudokusfromFile() async {
    String jsonString =
        await rootBundle.loadString('assets/listOfSudokus.json');

    Map<String, dynamic> parsedJson = json.decode(jsonString);

    listOfSudokus['easy'] = parsedJson['easy'];
    listOfSudokus['medium'] = parsedJson['medium'];
    listOfSudokus['hard'] = parsedJson['hard'];
  }

  static void getNewSudoku(String difficulty) {
    List<int> listOfValues = listOfSudokus[difficulty]![
        Random().nextInt(listOfSudokus[difficulty]!.length)];

    int i, j;
    for (int k = 0; k < 81; k++) {
      i = k ~/ 9;
      j = k % 9;

      board[i][j] = listOfValues[k];
    }

    if (cells[0].isEmpty) {
      createAllCells(board);
    } else {
      updateAllCells(board);
    }
  }

  static void resetSudoku() {
    for (int i = 0; i < 9; i++) {
      for (int j = 0; j < 9; j++) {
        cells[i][j].updateCellValue(board[i][j]);
      }
    }
  }

  static bool get isSudokuFilled {
    for (int i = 0; i < 9; i++) {
      for (int j = 0; j < 9; j++) {
        if (cells[i][j].cellValue == 0) {
          return false;
        }
      }
    }
    return true;
  }

  static bool isCellCorrect(Cell cell) {
    if (!checkRow(cell)) {
      return false;
    }

    if (!checkColumn(cell)) {
      return false;
    }

    if (!checkGrid(cell)) {
      return false;
    }

    return true;
  }

  static bool get isSudokuCorrect {
    for (int i = 0; i < 9; i++) {
      for (int j = 0; j < 9; j++) {
        var cell = cells[i][j];

        if (!checkRow(cell)) {
          return false;
        }

        if (!checkColumn(cell)) {
          return false;
        }

        if (!checkGrid(cell)) {
          return false;
        }
      }
    }
    return true;
  }

  static bool checkRow(Cell cell) {
    int row = cell.row;

    for (int col = 0; col < 9; col++) {
      if (col == cell.column) {
        continue;
      }

      if (cell.cellValue == cells[row][col].cellValue) {
        return false;
      }
    }

    return true;
  }

  static bool checkColumn(Cell cell) {
    int col = cell.column;

    for (int row = 0; row < 9; row++) {
      if (row == cell.row) {
        continue;
      }

      if (cell.cellValue == cells[row][col].cellValue) {
        return false;
      }
    }
    return true;
  }

  static bool checkGrid(Cell cell) {
    int col = cell.column;
    int row = cell.row;

    int sRow = (row ~/ 3) * 3;
    int eRow = ((row ~/ 3) + 1) * 3;
    int sCol = (col ~/ 3) * 3;
    int eCol = ((col ~/ 3) + 1) * 3;

    for (int i = sRow; i < eRow; i++) {
      for (int j = sCol; j < eCol; j++) {
        if (i == row && j == col) {
          continue;
        }

        if (cell.cellValue == cells[i][j].cellValue) {
          return false;
        }
      }
    }

    return true;
  }
}
