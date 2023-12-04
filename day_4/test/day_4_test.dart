import 'package:day_4/day_4.dart';
import 'package:test/test.dart';

void main() {
  test('Parse Card', () {
    var (cardId, winning, yours) =
        parseCard("Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53");

    expect(cardId, 1);
    expect(winning, [41, 48, 83, 86, 17]);
    expect(yours, [83, 86, 6, 31, 17, 9, 48, 53]);
  });

  test('Card points', (){
    var card = parseCard("Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53");
    expect(cardPoints(card), 8);

    var card2 = parseCard("Card 5: 87 83 26 28 32 | 88 30 70 12 93 22 82 36");
    expect(cardPoints(card2), 0);

    var card3 = parseCard("Card 3:  1 21 53 59 44 | 69 82 63 72 16 21 14  1");
    expect(cardPoints(card3), 2);
  });

  test('Winning cards', () {
    var card1 = parseCard("Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53");
    expect(winningCards(card1), [2, 3, 4, 5]);

    var card2 = parseCard("Card 2: 13 32 20 16 61 | 61 30 68 82 17 32 24 19");
    expect(winningCards(card2), [3,4]);
  });

  test("Calculate total scratchcards", () {
    List<Card> cards = [];

    cards.add(parseCard("Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53"));
    cards.add(parseCard("Card 2: 13 32 20 16 61 | 61 30 68 82 17 32 24 19"));
    cards.add(parseCard("Card 3:  1 21 53 59 44 | 69 82 63 72 16 21 14  1"));
    cards.add(parseCard("Card 4: 41 92 73 84 69 | 59 84 76 51 58  5 54 83"));
    cards.add(parseCard("Card 5: 87 83 26 28 32 | 88 30 70 12 93 22 82 36"));
    cards.add(parseCard("Card 6: 31 18 13 56 72 | 74 77 10 23 35 67 36 11"));

    Deck deck = Deck(cards);
    deck.calculate();
    print(deck.myCards);
    expect(deck.totalCards(), 30);
  });
}
