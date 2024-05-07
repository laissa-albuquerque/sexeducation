import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sexeducation/components/card_selection.dart';
import 'package:sexeducation/controllers/correct_cards_controller.dart';
import 'package:sexeducation/views/viewsForYears/group_five_to_eight/kids_games.dart';

import '../../../../components/global.dart';
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
  late final CorrectCardsGameController controller;

  late Timer _timerCountdown;
  late Timer _timerGame;
  bool gameStarted = false;
  int countdown = 3;
  int timeGameMinutes = 0;
  int timeGameSeconds = 59;
  String? selectedImageUrl;

  @override
  void initState() {
    super.initState();
    controller = CorrectCardsGameController();
    _startCountdown();
  }

  @override
  void dispose() {
    _timerGame.cancel();
    _timerCountdown.cancel();
    super.dispose();
  }

  void _startCountdown() {
    _timerCountdown = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (countdown > 1) {
          countdown--;
        } else {
          _timerCountdown.cancel();
          setState(() {
            gameStarted = true;
            controller.initializeGame();
             _initCountTimeGame();
          });
        }
      });
    });
  }

  _initCountTimeGame() {
    _timerGame = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (timeGameSeconds > 0) {
          timeGameSeconds--;
        } else {
          if (timeGameMinutes > 0) {
            timeGameMinutes--;
            timeGameSeconds = 59;
          } else {
            Navigator.of(context).pop();
            gameStarted = false;
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CorrectCardsGameController>(
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
                  _timerGame.cancel();
                  Navigator.pushNamed(context, KidsGameScreen.id);
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
                margin: const EdgeInsets.fromLTRB(12, 4, 12, 12),
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
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Consumer<CorrectCardsGameController>(
                builder: (context, controller, _) => GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  crossAxisSpacing: 6,
                  mainAxisSpacing: 6,
                  children:
                  controller.cards
                      .map(
                        (CardOptionModel go) => CardSelectionGame(cardOption: go),
                  )
                      .toList(),
                ),
              ),
              const SizedBox(height: 26),
              CusttomButton(buttonText: 'Finalizar', onPressed: () {
                controller.allSelected ? _showWinDialog() : _showWinDialogLoser();
              }, colors: const [Color(0xFFbfcaff),
                Color(0xFFb9c5ff),
                Color(0xFFb3c0ff),
                Color(0xFFaebbff),
                Color(0xFFa8b7ff),
                Color(0xFFa2b2ff),
                Color(0xFF9cadff),
                Color(0xFF96a8ff),],)
            ],
          ),
        ),
      ],
    );
  }

  void _showWinDialog() {
    _timerGame.cancel();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Venceu!'),
          content: const Text('Parabéns, você venceu o jogo!'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                _timerGame.cancel();
                Navigator.pushNamed(context, KidsGameScreen.id);
              },
              child: const Text('Voltar'),
            ),
          ],
        );
      },
    );
  }

  void _showWinDialogLoser() {
    _timerGame.cancel();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Tente novamente!'),
          content: const Text('Tem certeza das suas escolhas? Revise-as'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                _timerGame.cancel();
                Navigator.pushNamed(context, CorrectCardsScreen.id);
              },
              child: const Text('Voltar'),
            ),
          ],
        );
      },
    );
  }
}
