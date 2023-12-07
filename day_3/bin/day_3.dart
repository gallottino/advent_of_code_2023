/// Author: gallottino (d.gallotti@outlook.it)
/// Advent Of Code 2023 - Day 3
/// url: https://adventofcode.com/2023/day/3

import 'dart:io';

import 'package:day_3/day_3.dart';

void main(List<String> arguments) {
  File("input.txt").readAsString().then((String contents) {
    Engine engine = Engine.parse(contents);
    engine.searchForSymbol();
    print("The solution is: ${engine.sumPartNumbers()}");
    print("Total Gear Ratio is: ${engine.totalGearRatio()}");
  });
}
