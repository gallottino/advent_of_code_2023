// e.g. Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green

typedef Game = (int, Map<String, double>);

Game parseGame(String game) {
  Map<String, double> cubes = {
    "red": 0.0,
    "green": 0.0,
    "blue": 0.0,
  };

  List<String> infoAndSets = game.split(":");

  List<String> info = infoAndSets[0].split(" ");
  int gameNumber = int.parse(info[1]);

  List<String> sets = infoAndSets[1].split(";");
  for (String set in sets) {
    List<String> cubesAndColors = set.split(",");

    for (String cubeAndColor in cubesAndColors) {
      List<String> cubeAndColorList = cubeAndColor.trim().split(" ");

      double cubeNumber = double.parse(cubeAndColorList[0]);
      String cubeColor = cubeAndColorList[1];
      double maxCubeNumber = cubes[cubeColor]!;
      if (cubeNumber > maxCubeNumber) {
        cubes[cubeColor] = cubeNumber;
      }
    }
  }

  return (gameNumber, cubes);
}


bool isValid(Game game) {
  int maxRed = 12;
  int maxGreen = 13;
  int maxBlue = 14;

  var (_, cubes) = game;
  return cubes["red"]! <= maxRed &&
      cubes["green"]! <= maxGreen &&
      cubes["blue"]! <= maxBlue;
}

double gamePower(Game game) {
  var (_, cubes) = game;
  return cubes["red"]! * cubes["green"]! * cubes["blue"]!;
}