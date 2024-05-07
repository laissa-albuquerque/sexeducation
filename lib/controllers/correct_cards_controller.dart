import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../models/card.dart';

class CorrectCardsGameController extends ChangeNotifier {
  final List<CardOptionModel> cards = [
    CardOptionModel(
        urlCard: 'assets/cards/card1-menina.png',
        selected: false,
        matched: false,
        canBeChosen: true),
    CardOptionModel(
        urlCard: 'assets/cards/card2-menina.png',
        selected: false,
        matched: false,
        canBeChosen: true),
    CardOptionModel(
        urlCard: 'assets/cards/card3-menina.png',
        selected: false,
        matched: false,
        canBeChosen: true),
    CardOptionModel(
        urlCard: 'assets/cards/card1-menino.png',
        selected: false,
        matched: false,
        canBeChosen: true),
    CardOptionModel(
        urlCard: 'assets/cards/card2-menino.png',
        selected: false,
        matched: false,
        canBeChosen: true),
    CardOptionModel(
        urlCard: 'assets/cards/card3-menino.png',
        selected: false,
        matched: false,
        canBeChosen: true),
    CardOptionModel(
        urlCard: 'assets/cards/nariz.png',
        selected: false,
        matched: false,
        canBeChosen: false),
    CardOptionModel(
        urlCard: 'assets/cards/olhos.png',
        selected: false,
        matched: false,
        canBeChosen: false),
    CardOptionModel(
        urlCard: 'assets/cards/boca.png',
        selected: false,
        matched: false,
        canBeChosen: false),
  ];

  List<CardOptionModel> chosenCards = [];

  bool allSelected = false;

  bool get fullGame => (chosenCards.length == 6);

  initializeGame() {
    chosenCards.clear();
    cards.shuffle();
  }

  choiceCard(CardOptionModel card) async {
    await _selectCard(card);

    if (fullGame) {
      await validateEndOfGame();
    }
  }

  _selectCard(CardOptionModel card) async {
    if (!fullGame) {
      if (!card.selected) {
        card.selected = true;
        chosenCards.add(card);
      } else {
        card.selected = false;
        chosenCards.remove(card);
      }
    }
  }

  validateEndOfGame() {
    int totalCanBeChosen = 0;
    for (var card in chosenCards) {
      if (card.canBeChosen) {
        totalCanBeChosen += 1;
      }
    }

    if (totalCanBeChosen == 6) {
      print('venceu');
      allSelected = true;
    } else {
      print('tente dnv');
      for(int i = 0; i < cards.length; i++) {
        cards[i].selected = false;
      }
    }
  }
}
