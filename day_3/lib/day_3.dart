// Every line is a row of the engine
// The list of bool needs to understand
// if a number is alredy been taken
import 'dart:collection';

class Engine {
  List<String> lines;
  List<List<bool>> used;

  Engine(this.lines, this.used);

  factory Engine.parse(String input) {
    List<String> lines = input.split('\n');
    List<List<bool>> used = List<List<bool>>.generate(lines.length,
        (i) => List<bool>.generate(lines[i].length, (j) => false));

    return Engine(lines, used);
  }

  void searchForSymbol() {
    for (int row = 0; row < lines.length; row++) {
      for (int col = 0; col < lines[row].length; col++) {
        if (isSymbol(lines[row][col])) {
          searchAdjacentNumbers(row, col);
        }
      }
    }
  }

  bool isNumber(String value) {
    return int.tryParse(value) != null;
  }

  bool isSymbol(String value) {
    return !isNumber(value) && value != '.';
  }

  void searchAdjacentNumbers(int row, int col) {
    const offsets = [
      [-1, -1],
      [-1, 0],
      [-1, 1],
      [0, -1],
      [0, 1],
      [1, -1],
      [1, 0],
      [1, 1]
    ];

    for (var offset in offsets) {
      int rowOffset = offset[0];
      int colOffset = offset[1];

      if (isInside(row + rowOffset, col + colOffset) == false) continue;

      if (isNumber(lines[row + rowOffset][col + colOffset])) {
        spreadNumber(row + rowOffset, col + colOffset);
      }
    }
  }

  void spreadNumber(int row, int col) {
    if (isInside(row, col) == false) return;
    if (isNumber(lines[row][col]) == false) return;
    if (used[row][col] == true) return;

    used[row][col] = true;
    spreadNumber(row, col - 1);
    spreadNumber(row, col + 1);
  }

  bool isInside(int row, int col) {
    return row >= 0 &&
        row < lines.length &&
        col >= 0 &&
        col < lines[row].length;
  }

  double sumPartNumbers() {
    double sum = 0;
    for (int row = 0; row < lines.length; row++) {
      for (int col = 0; col < lines[row].length; col++) {
        if (used[row][col]) {
          var numberStr = getNumber(row, col);
          sum += double.parse(numberStr);
        }
      }
    }
    return sum;
  }

  String getNumber(int row, int col, {String current = ""}) {
    if (isInside(row, col) == false) return current;
    if (used[row][col] == false) return current;

    used[row][col] = false;
    current += lines[row][col];
    return getNumber(row, col + 1, current: current);
  }
}

extension Gear on Engine {

  double parseNumber(int row, int col) {
    Queue numberQueue = Queue();
    numberQueue.add(lines[row][col]);

    used[row][col] = true;
    // move left
    var left = col - 1;
    while (isInside(row, left) && isNumber(lines[row][left])) {
      numberQueue.addFirst(lines[row][left]);
      used[row][left] = true;
      left--;
    }

    var right = col + 1;
    while (isInside(row, right) && isNumber(lines[row][right])) {
      numberQueue.addLast(lines[row][right]);
      used[row][right] = true;
      right++;
    }

    return double.parse(numberQueue.join());
  }

  List<double> getAdjacentNumbers(int row, int col) {
    List<double> adjacentNumbers = [];
    const offsets = [
      [-1, -1],
      [-1, 0],
      [-1, 1],
      [0, -1],
      [0, 1],
      [1, -1],
      [1, 0],
      [1, 1]
    ];

    for (var offset in offsets) {
      int rowOffset = offset[0];
      int colOffset = offset[1];

      if (isInside(row + rowOffset, col + colOffset) == false) continue;

      if (isNumber(lines[row + rowOffset][col + colOffset]) &&
          used[row + rowOffset][col + colOffset] == false) {
        adjacentNumbers.add(parseNumber(row + rowOffset, col + colOffset));
      }
    }

    resetUsed(row);

    return adjacentNumbers;
  }

  double totalGearRatio() {
    double totalRatio = 0;
    for (int row = 0; row < lines.length; row++) {
      for (int col = 0; col < lines[row].length; col++) {
        if (lines[row][col] == '*') {
          List<double> adjNumbers = getAdjacentNumbers(row, col);
          if(adjNumbers.length == 2) { // it is a gear
            totalRatio += adjNumbers[0] * adjNumbers[1];
          }
        }
      }
    }

    return totalRatio;
  }

  bool isGear(int row, int col) {
    if (lines[row][col] != '*') return false;
    return false;
  }

  void resetUsed(int row) {
    for (int col = 0; col < lines[row].length; col++) {
      if (isInside(row - 1, col)) {
        used[row - 1][col] = false;
      }
      if (isInside(row + 1, col)) {
        used[row + 1][col] = false;
      }
      used[row][col] = false;
    }
  }
}
