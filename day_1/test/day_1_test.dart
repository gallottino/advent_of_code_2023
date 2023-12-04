import 'package:day_1/day_1.dart';
import 'package:test/test.dart';

void main() {
  test('get first number (only numeric allowed)', () {
    expect(findDigit("1abc2"), "1");
    expect(findDigit("pqr3stu8vwx"), "3");
    expect(findDigit("a1b2c3d4e5f"), "1");
    expect(findDigit("treb7uchet"), "7");
  });

  test('get last number (only numeric allowed)', () {
    expect(findDigit("1abc2", last: true), "2");
    expect(findDigit("pqr3stu8vwx", last: true), "8");
    expect(findDigit("a1b2c3d4e5f", last: true), "5");
    expect(findDigit("treb7uchet", last: true), "7");
  });

  test('get number form first and last (only numeric allowed)', () {
    expect(findFirstAndLastNumber("1abc2"), 12);
    expect(findFirstAndLastNumber("pqr3stu8vwx"), 38);
    expect(findFirstAndLastNumber("a1b2c3d4e5f"), 15);
    expect(findFirstAndLastNumber("treb7uchet"), 77);
  });

  test('get number from string', () {
    expect(getNumber("zero"), 0);
    expect(getNumber("one"), 1);
    expect(getNumber("two"), 2);
    expect(getNumber("three"), 3);
    expect(getNumber("four"), 4);
    expect(getNumber("five"), 5);
    expect(getNumber("six"), 6);
    expect(getNumber("seven"), 7);
    expect(getNumber("eight"), 8);
    expect(getNumber("nine"), 9);
  });

  test("maybe a number", () {
    expect(getNumber("zer"), -1);
    expect(getNumber("sevent"), -2);
    expect(getNumber("eni", reverse: true), -1);
    expect(getNumber("zyx", reverse: true), -2);
  });

  test("reversed string get number", () {
    expect(getNumber("eerht", reverse: true), 3);
    expect(getNumber("enin", reverse: true), 9);
  });

  test("reverse string", () {
    expect(reverseString("abc"), "cba");
    expect(reverseString("123"), "321");
    expect(reverseString("enin"), "nine");
  });

  test("resized string", () {
    expect(resizeMaybeNumber("ts"), "s");
    expect(resizeMaybeNumber("teens"), "s");
    expect(resizeMaybeNumber("teen"), "n");
    expect(resizeMaybeNumber("teen", reverse: true), "en");
  });

  test('get first number (also string)', () {
    expect(findDigit("one"), "1");
    expect(findDigit("tsix"), "6");
  });

  test('get last number', () {
    expect(findDigit("two1nine", last: true), "9");
    expect(findDigit("7pqrstsixteen", last: true), "6");
  });

  test('get number form first and last (also string)', () {
    expect(findFirstAndLastNumber("tsix"), 66);
    expect(findFirstAndLastNumber("two1nine"), 29);
    expect(findFirstAndLastNumber("4nineeightseven2"), 42);
    expect(findFirstAndLastNumber("abcone2threexyz"), 13);
    expect(findFirstAndLastNumber("7pqrstsixteen"), 76);
  });
}
