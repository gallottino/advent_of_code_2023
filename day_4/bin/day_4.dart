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
