import 'package:day_2/day_2.dart';
import 'package:test/test.dart';

void main() {

  test("parse Game", () {
    String gameStr = "Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green";
    Map<String, int> assertCubes = {
      "red": 4,
      "green": 2,
      "blue": 6,
    };

    var (id, cubes) = parseGame(gameStr);
    expect(id, 1);
    expect(cubes, assertCubes);
  });

  test("is game valid", () {
    String gameStr = "Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green";

    var game = parseGame(gameStr);
    expect(isValid(game), true);
  });

  test("is game not valid", () {
    String gameStr = "Game 19: 6 red, 1 green, 18 blue; 2 red, 1 blue; 7 blue, 3 red, 2 green; 18 blue, 2 green, 1 red; 7 red, 10 blue";
    var game = parseGame(gameStr);
    expect(isValid(game), false);
  });

  test("power of a Game", () {
    String gameStr = "Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green";

    var game = parseGame(gameStr);
    expect(gamePower(game), 48);
  });
}
