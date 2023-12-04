/// Author: gallottino (d.gallotti@outlook.it)
/// Advent Of Code 2023 - Day 2
/// url: https://adventofcode.com/2023/day/2

import 'dart:io';

import 'package:day_2/day_2.dart' as day_2;
import 'package:day_2/day_2.dart';

void main(List<String> arguments) {
  File("input.txt").readAsString().then((String contents) {
    int idsSum = 0;
    double totalPower = 0;
    for(String game in contents.split("\n")) {
      var (id, cubes) = day_2.parseGame(game);
      if (day_2.isValid((id, cubes))) {
        idsSum += id;
      }
      totalPower += gamePower((id, cubes));
    }
    print("The sum of all valid game ids is : $idsSum");
    print("The total power of all valid games is : $totalPower");
  });
}
