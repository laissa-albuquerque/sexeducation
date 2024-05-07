import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sexeducation/components/card_selection.dart';

import '../../../../controllers/memory_game_controller.dart';
import '../../../../models/card.dart';

class CorrectCardsScreen extends StatefulWidget {
  final CardOptionModel? optionCard;

  const CorrectCardsScreen({Key? key, this.optionCard}) : super(key: key);

  static String id = 'correct_cards_game_view';

  @override
  State<StatefulWidget> createState() => _CorrectCardsScreen();
}

class _CorrectCardsScreen extends State<CorrectCardsScreen>
    with SingleTickerProviderStateMixin {
  late final MemoryGameController controller = MemoryGameController();
  bool gameStarted = false;
  int countdown = 3;
  int timeGameMinutes = 3;
  int timeGameSeconds = 59;
  String? selectedImageUrl;

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

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  void _startCountdown() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (countdown > 1) {
          countdown--;
        } else {
          timer.cancel();
          setState(() {
            gameStarted = true;
            controller.initializeGame();
            // _initCountTimeGame();
          });
        }
      });
    });
  }

  // _initCountTimeGame() {
  //   Timer.periodic(const Duration(seconds: 1), (timer) {
  //     setState(() {
  //       if (timeGameSeconds > 0) {
  //         timeGameSeconds--;
  //       } else {
  //         if (timeGameMinutes > 0) {
  //           timeGameMinutes--;
  //           timeGameSeconds = 59;
  //         } else {
  //           timer.cancel();
  //           Navigator.of(context).pop();
  //           gameStarted = false;
  //         }
  //       }
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MemoryGameController>(
      create: (_) => controller,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: Color(0xff0E0019),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset('assets/images-games/time.png',
                      width: 48, height: 48),
                  Text(
                    timeGameSeconds < 10
                        ? '0$timeGameMinutes:0$timeGameSeconds'
                        : '0$timeGameMinutes:$timeGameSeconds',
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'Fredoka',
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Partes Íntimas',
                    style: TextStyle(
                      color: Colors.white70,
                      fontFamily: 'Fredoka',
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Voltar',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Fredoka',
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment(0.8, 1),
                  colors: <Color>[
                    Color(0xFF0e0019),
                    Color(0xFF150423),
                    Color(0xFF19082d),
                    Color(0xFF1d0a38),
                    Color(0xFF230943),
                    Color(0xFF29084d),
                    Color(0xFF300558),
                    Color(0xFF380063),
                  ],
                ),
              ),
            ),
            Image.asset('assets/images/stars-two.png', fit: BoxFit.fitHeight),
            Center(
                child: gameStarted
                    ? _buildGridView()
                    : Container(
                  width: 88,
                  height: 88,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.lightGreen,
                    borderRadius:
                    const BorderRadius.all(Radius.circular(100.0)),
                    border:
                    Border.all(color: Colors.transparent, width: 3.0),
                  ),
                  child: Text(
                    '$countdown',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                      fontFamily: 'Fredoka',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildGridView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
          width: 400,
          height: 120,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20.0)),
            border: Border.all(color: Colors.transparent, width: 3.0),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment(0.8, 1),
              colors: <Color>[
                Color(0xFF0e0019),
                Color(0xFF150423),
                Color(0xFF19082d),
                Color(0xFF1d0a38),
                Color(0xFF230943),
                Color(0xFF29084d),
                Color(0xFF300558),
                Color(0xFF380063),
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(12, 4, 12, 4),
                child: const Text(
                  'Agora selecione apenas as figuras que representam as partes'
                      ' íntimas dos meninos e das meninas.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'KleeOne',
                    decoration: TextDecoration.none,
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          child: Consumer<MemoryGameController>(
            builder: (context, controller, _) => GridView.count(
              shrinkWrap: true,
              crossAxisCount: 3,
              crossAxisSpacing: 6,
              mainAxisSpacing: 6,
              children: controller.cards
                  .map(
                    (CardOptionModel go) => CardSelectionGame(cardOption: go),
              )
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
