const maybeNumber = -1;
const notNumber = -2;

int findFirstAndLastNumber(String line) {
  String firstDigit = findDigit(line);
  String lastDigit = findDigit(line, last: true);

  return int.parse("$firstDigit$lastDigit");
}

String findDigit(String line, {bool last = false}) {
  String stringNumber = "";

  // This is not good for performance, but it is for usability
  if (last) {
    line = reverseString(line);
  }

  for (int i = 0; i < line.length; i++) {
    // Current char is a number
    if (int.tryParse(line[i]) != null) {
      return line[i];
    }
    // Try to get a number from String (e.g. "one" -> 1")
    else {
      stringNumber += line[i];
      int number = getNumber(stringNumber, reverse: last);

      switch (number) {
        case maybeNumber:
          continue;
        case notNumber:
          // I need to search for a contained string that maybe is a number
          stringNumber = resizeMaybeNumber(stringNumber, reverse: last);
          continue;
        default:
          return number.toString();
      }
    }
  }

  return "";
}

int getNumber(String input, {bool reverse = false}) {
  if (input.length > 5) return notNumber;

  if (reverse) {
    input = reverseString(input);
  }

  const Map<String, int> numbers = {
    "zero": 0,
    "one": 1,
    "two": 2,
    "three": 3,
    "four": 4,
    "five": 5,
    "six": 6,
    "seven": 7,
    "eight": 8,
    "nine": 9
  };

  for (String number in numbers.keys) {
    if (input == number) {
      return numbers[number]!;
    } else if (
        // I need to check startWith if i'm searching for the first digit
        (number.startsWith(input) && !reverse) ||
        // and endWith if i'm searching for the last digit
        (number.endsWith(input) && reverse)
      ) {
      return maybeNumber;
    }
  }

  return notNumber;
}

String reverseString(String input) {
  String newInput = "";
  for (int i = 0; i < input.length; i++) {
    newInput += input[input.length - i - 1];
  }
  return newInput;
}

String resizeMaybeNumber(String input, {bool reverse = false}) {
  String resized = String.fromCharCodes(input.codeUnits);
  for (int i = 0; i < input.length; i++) {
    resized = input.substring(i, input.length);
    if (getNumber(resized, reverse: reverse) == maybeNumber) {
      return resized;
    }
  }
  return "";
}
