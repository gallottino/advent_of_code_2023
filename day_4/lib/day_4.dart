import 'dart:math';

typedef Card = (int, List<int>, List<int>);

// Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53
Card parseCard(String line) {
  List<String> cardInfo = line.split(":");
  int cardId = int.parse(cleanupWhitespace(cardInfo[0].trim()).split(" ")[1]);

  List<String> cardNumbers = cardInfo[1].split("|");

  List<int> winningNumbers = cleanupWhitespace(cardNumbers[0].trim())
      .split(" ")
      .map((s) => int.parse(s))
      .toList();

  List<int> yourNumbers = cleanupWhitespace(cardNumbers[1].trim())
      .split(" ")
      .map((s) => int.parse(s))
      .toList();

  return (cardId, winningNumbers, yourNumbers);
}

final _whitespaceRegex = RegExp(r"\s+");
String cleanupWhitespace(String input) => input.replaceAll(_whitespaceRegex, " ");


num cardPoints(Card card) {
  int points = 0;

  var(_, winning, yours) = card;

  for (var number in yours) {
    if (winning.contains(number)) {
      points += 1;
    }
  }

  return points > 0 ? pow(2, points - 1) : 0;
}


List<int> winningCards(Card card) {
  int points = 0;

  var(id, winning, yours) = card;

  for (var number in yours) {
    if (winning.contains(number)) {
      points += 1;
    }
  }

  List<int> winningCards = [];
  for(int i = 1; i <= points; i++) {
    winningCards.add(id + i);
  }
  return winningCards;
}

class Deck {
  List<Card> originalCards;
  Map<int, int> myCards = {};
  int winnedCards = 0;

  Deck(this.originalCards);

  void calculate() {

    for(int i = 1; i <= originalCards.length; i++) {
      var card = originalCards[i - 1];
      var amountCurrentCard = myCards[i] ?? 1; // if not found, start from 1
      var listWinningCards = winningCards(card);
      winnedCards += amountCurrentCard * listWinningCards.length;

      // Update amount of my cards with duplicate
      for(var card in listWinningCards) {
        myCards[card] = (myCards[card] ?? 1) + amountCurrentCard;
      }
    }
  }

  int totalCards()  {
    return winnedCards + originalCards.length;
  }
}
