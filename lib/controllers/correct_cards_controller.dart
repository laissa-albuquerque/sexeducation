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
    cards.shuffle();
    chosenCards = [];
  }

  choiceCard(CardOptionModel card) async {
    await _selectCard(card);
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
    } else {
      await validateEndOfGame();
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
    } else {
      print('tente dnv');
      chosenCards = [];
    }
  }
}
