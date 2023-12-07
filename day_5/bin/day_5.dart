import 'dart:io';

import 'package:day_5/day_5.dart';

import '../test/day_5_test.dart';

void main(List<String> arguments) {
  File("input.txt").readAsString().then((arguments) {
    var (seeds, mapper) = parseInput(arguments);

    double minPart1 = calculateMinLocation((seeds, mapper));
    double minPart2 = calculateMinLocationPart2((seeds, mapper));

    print("The minimum location is $minPart1");
    print("The minimum location is $minPart2");
  });
}
