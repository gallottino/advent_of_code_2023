import 'dart:math';

import 'package:day_5/day_5.dart';
import 'package:test/test.dart';

const exampleMap = """
light-to-temperature map:
45 77 2
81 45 1
68 64 1""";

const seedToSoilString = """
seed-to-soil map:
50 98 2
52 50 48""";

const exampleInput = """
seeds: 79 14 55 13

seed-to-soil map:
50 98 2
52 50 48

soil-to-fertilizer map:
0 15 37
37 52 2
39 0 15

fertilizer-to-water map:
49 53 8
0 11 42
42 0 7
57 7 4

water-to-light map:
88 18 7
18 25 70

light-to-temperature map:
45 77 23
81 45 19
68 64 13

temperature-to-humidity map:
0 69 1
1 0 69

humidity-to-location map:
60 56 37
56 93 4""";

void main() {
  test("parse Mapper", () {
    Mapper lightToTemperature = Mapper.parse(exampleMap);

    expect(lightToTemperature.source, "light");
    expect(lightToTemperature.destination, "temperature");
    expect(lightToTemperature.mapper, [(45, 77, 2), (81, 45, 1), (68, 64, 1)]);
  });

  test("processLine()", () {
    String line = " 45 77 23";

    var (source, destination, range) = Mapper.processLine(line);
    expect(source, 45);
    expect(destination, 77);
    expect(range, 23);
  });

  test("get Seeds", () {
    String line = "seeds: 79 14 55 13";

    List<double> seeds = getSeeds(line);
    expect(seeds, [79, 14, 55, 13]);
  });

  test("getDestination()", () {
    Mapper seedToSoil = Mapper.parse(seedToSoilString);
    expect(seedToSoil.getDestination(79), 81);
    expect(seedToSoil.getDestination(14), 14);
    expect(seedToSoil.getDestination(55), 57);
    expect(seedToSoil.getDestination(13), 13);
  });

  test("parseInput()", () {
    var (seeds, mappers) = parseInput(exampleInput);

    expect(seeds, [79, 14, 55, 13]);
    expect(mappers.length, 7);
  });

  test("minLocation()", () {
    var (seeds, mappers) = parseInput(exampleInput);
    expect(calculateMinLocation((seeds, mappers)), 35);
  });
}
