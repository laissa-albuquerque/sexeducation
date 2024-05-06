import 'package:flutter/cupertino.dart';

import '../models/card.dart';

class MemoryGameController extends ChangeNotifier {

  final List<CardOptionModel> cards = [
    CardOptionModel(
        urlCard: 'assets/cards/card1-menina.png',
        selected: false,
        matched: false),
    CardOptionModel(
        urlCard: 'assets/cards/card2-menina.png',
        selected: false,
        matched: false),
    CardOptionModel(
        urlCard: 'assets/cards/card3-menina.png',
        selected: false,
        matched: false),
    CardOptionModel(
        urlCard: 'assets/cards/card1-menino.png',
        selected: false,
        matched: false),
    CardOptionModel(
        urlCard: 'assets/cards/card2-menino.png',
        selected: false,
        matched: false),
    CardOptionModel(
        urlCard: 'assets/cards/card3-menino.png',
        selected: false,
        matched: false),
    CardOptionModel(
        urlCard: 'assets/cards/nariz.png', selected: false, matched: false),
    CardOptionModel(
        urlCard: 'assets/cards/olhos.png', selected: false, matched: false),
    CardOptionModel(
        urlCard: 'assets/cards/boca.png', selected: false, matched: false),
  ];
  final List<CardOptionModel> cannotBeChosen = [
    CardOptionModel(
        urlCard: 'assets/cards/nariz.png', selected: false, matched: false),
    CardOptionModel(
        urlCard: 'assets/cards/olhos.png', selected: false, matched: false),
    CardOptionModel(
        urlCard: 'assets/cards/boca.png', selected: false, matched: false),
  ];


  List<CardOptionModel> allCards = [];
  List<CardOptionModel> chosenCards = [];
  List<Function> _choiceCallback = [];

  bool get fullGame => (chosenCards.length == 2);

  void initializeGame() {
    allCards.clear();
    allCards.addAll(cards);
    allCards.addAll(cards);

    allCards.shuffle();
  }

  choiceCard(CardOptionModel card, Function resetCard) async {
    chosenCards.add(card);
    _choiceCallback.add(resetCard);
    await _compareCards();
  }

  _compareCards() async {
    if(fullGame) {
      if(chosenCards[0].urlCard == chosenCards[1].urlCard) {
        chosenCards[0].matched = true;
        chosenCards[1].matched = true;
      } else {
        await Future.delayed(const Duration(seconds: 1), () {
          for(var i in [0,1]) {
            chosenCards[i].selected = false;
            _choiceCallback[i]();
          }
        });
      }
      chosenCards = [];
      _choiceCallback = [];
    }
  }
}