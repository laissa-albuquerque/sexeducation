import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sexeducation/views/viewsForYears/group_five_to_eight/games/correct_cards.dart';

import '../../../../components/card_game.dart';
import '../../../../controllers/memory_game_controller.dart';
import '../../../../models/card.dart';

class MemoryGameScreen extends StatefulWidget {
  final CardOptionModel? optionCard;

  const MemoryGameScreen({Key? key, this.optionCard}) : super(key: key);

  static String id = 'memory_game_view';

  @override
  State<StatefulWidget> createState() => _MemoryGameScreen();
}

class _MemoryGameScreen extends State<MemoryGameScreen>
    with SingleTickerProviderStateMixin {
  late final MemoryGameController controller = MemoryGameController();
  bool gameStarted = false;
  int countdown = 3;
  int timerMessage = 1;
  int timeGameMinutes = 1;
  int timeGameSeconds = 59;

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  void _startCountdown() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timerMessage > 0) {
        setState(() {
          timerMessage--;
        });
      } else if (timerMessage == 0) {
        setState(() {
          if (countdown > 1) {
            countdown--;
          } else {
            timer.cancel();
            setState(() {
              gameStarted = true;
              controller.initializeGame();
              _initCountTimeGame();
            });
          }
        });
      }
    });
  }

  _initCountTimeGame() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (timeGameSeconds > 0) {
          timeGameSeconds--;
        } else {
          if (timeGameMinutes > 0) {
            timeGameMinutes--;
            timeGameSeconds = 5;
          } else {
            timer.cancel();
            Navigator.pushNamed(context, CorrectCardsScreen.id);
            gameStarted = false;
          }
        }
      });
    });
  }

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
                    timeGameSeconds < 10 ? '0$timeGameMinutes:0$timeGameSeconds' : '0$timeGameMinutes:$timeGameSeconds',
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
                    'Jogo da Memória',
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
                  : timerMessage > 0
                      ? const Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                          child: Text(
                            'Encontre os pares. Lembre-se: Ao encontrar todos os pares, clique em qualquer lugar da tela para continuar.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 28,
                              color: Colors.white,
                              fontFamily: 'KleeOne',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      : Container(
                          width: 88,
                          height: 88,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.lightGreen,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(100.0)),
                            border: Border.all(
                                color: Colors.transparent, width: 3.0),
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
                        ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGridView() {
    return Consumer<MemoryGameController>(
      builder: (context, controller, _) => GridView.count(
        shrinkWrap: true,
        crossAxisCount: 3,
        crossAxisSpacing: 6,
        mainAxisSpacing: 6,
        children: controller.allCards
            .map(
              (CardOptionModel go) => CardGame(cardOption: go),
            )
            .toList(),
      ),
    );
  }
}
