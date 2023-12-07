/// Author: gallottino (d.gallotti@outlook.it)
/// Advent Of Code 2023 - Day 4
/// url: https://adventofcode.com/2023/day/4

import 'dart:io';

import 'package:day_4/day_4.dart';

void main(List<String> arguments) {
  File("input.txt").readAsString().then((String contents) {
    var cards = contents.split("\n").map((line) => parseCard(line));

    num totalPoints = 0;
    for (var card in cards) {
      totalPoints += cardPoints(card);
    }

    print("Total points: $totalPoints");

    Deck deck = Deck(cards.toList());
    deck.calculate();

    print("Total cards: ${deck.totalCards()}");
  });
}
