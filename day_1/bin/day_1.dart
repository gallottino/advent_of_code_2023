/// Author: gallottino (d.gallotti@outlook.it)
/// Advent Of Code 2023 - Day 1
/// url: https://adventofcode.com/2023/day/1

import 'dart:io';
import 'package:day_1/day_1.dart';

void main(List<String> arguments) {
  File("input.txt").readAsString().then((String contents) {
    int sum = 0;
    for (String line in contents.split("\n")) {
      int next = findFirstAndLastNumber(line);
      sum += next;
    }

    print("The solution is: $sum");
  });
}
