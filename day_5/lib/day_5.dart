import 'dart:core';

class Mapper {
  String source;
  String destination;
  List<(double, double, double)> mapper;

  Mapper(this.source, this.destination, this.mapper);

  // light-to-temperature map:
  // 45 77 23
  // 81 45 19
  // 68 64 13
  factory Mapper.parse(String input) {
    List<String> toParse = input.split("\n");

    String source = toParse[0].split(" ")[0].split("-")[0];
    String destination = toParse[0].split(" ")[0].split("-")[2];
    List<(double, double, double)> mapper = [];

    for (int i = 1; i < toParse.length; i++) {
      mapper.add(processLine(toParse[i]));
    }

    return Mapper(source, destination, mapper);
  }

  double getDestination(double value) {
    for (var (destination, source, range) in mapper) {
      double delta = value - source;
      if (delta >= 0 && delta <= range) {
        return destination + delta;
      }
    }
    return value;
  }

  static (double, double, double) processLine(String line) {
    List<String> toParse = cleanupWhitespace(line.trim()).split(" ");

    double source = double.parse(toParse[0]);
    double destination = double.parse(toParse[1]);
    double range = double.parse(toParse[2]);

    return (source, destination, range);
  }
}

(List<double>, List<Mapper>) parseInput(String arguments) {
  List<String> content = arguments.split("\n");

  List<double> seeds = getSeeds(content[0]);
  print(seeds);

  List<Mapper> mapper = [];
  List<String> current = [];
  for (int i = 1; i < content.length; i++) {
    if (content[i].isEmpty) {
      if (current.isNotEmpty) {
        mapper.add(Mapper.parse(current.join("\n")));
      }
      current = [];
    } else {
      current.add(content[i]);
    }
  }
  mapper.add(Mapper.parse(current.join("\n")));

  return (seeds, mapper);
}

double calculateLocation(List<Mapper> mapper, double seed) {
  double location = seed;
  for (var map in mapper) {
    location = map.getDestination(location);
  }
  return location;
}

double calculateMinLocation((List<double>, List<Mapper>) input) {
  var (seeds, mapper) = input;

  double min = double.maxFinite;
  for (double seed in seeds) {
    double location = calculateLocation(mapper, seed);
    print(location);
    if (location < min) {
      min = location;
    }
  }

  return min;
}

double calculateMinLocationPart2((List<double>, List<Mapper>) input) {
  var (seeds, mapper) = input;
  double min = double.maxFinite;

  for (int i = 0; i < seeds.length; i+=2) {
    for(int j = 1; j <= seeds[i + 1]; j++) {
      double location = calculateLocation(mapper, seeds[i] + j);
      if (location < min) {
        min = location;
      }
    }
  }

  return min;
}

List<double> getSeeds(String line) {
  List<String> toParse = line.split(":");

  toParse = cleanupWhitespace(toParse[1].trim()).split(" ");
  return toParse.map((numberStr) => double.parse(numberStr)).toList();
}

final _whitespaceRegex = RegExp(r"\s+");
String cleanupWhitespace(String input) =>
    input.replaceAll(_whitespaceRegex, " ");
