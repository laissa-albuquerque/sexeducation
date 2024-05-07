import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sexeducation/controllers/memory_game_controller.dart';
import 'package:sexeducation/models/card.dart';
import 'package:sexeducation/views/viewsForYears/group_five_to_eight/games/correct_cards.dart';

class CardGame extends StatefulWidget {
  final CardOptionModel cardOption;
  final Function onGameComplete;

  const CardGame({
    Key? key,
    required this.cardOption,
    required this.onGameComplete
  }) : super(key: key);

  @override
  State<CardGame> createState() => _CardGameState();
}

class _CardGameState extends State<CardGame>
    with SingleTickerProviderStateMixin {
  late final AnimationController animation;
  late final MemoryGameController controller =
      context.read<MemoryGameController>();

  @override
  void initState() {
    super.initState();
    controller.initializeGame();
    animation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
  }

  AssetImage getImage(double angle) {
    if (angle > 0.5 * pi) {
      return AssetImage('${widget.cardOption.urlCard}');
    } else {
      return const AssetImage('assets/cards/verso.png');
    }
  }

  flipCard() {
    final game = context.read<MemoryGameController>();
    if (!animation.isAnimating &&
        !widget.cardOption.matched &&
        !widget.cardOption.selected &&
        !game.fullGame &&
        !game.allPairsSelected) {
      animation.forward();
      game.choiceCard(widget.cardOption, resetCard);
    }

    if (game.allPairsSelected) {
      Future.delayed(const Duration(milliseconds: 300), () {
        Navigator.pushNamed(context, CorrectCardsScreen.id);
        widget.onGameComplete();// Cancela o timer quando a página muda
      });
    }
  }

  resetCard() {
    animation.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, _) {
        final angle = animation.value * pi;
        final transform = Matrix4.identity()
          ..setEntry(3, 2, 0.002)
          ..rotateY(angle);

        return GestureDetector(
          onTap: () {
            flipCard();
          },
          child: Transform(
            transform: transform,
            alignment: Alignment.center,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 5,
                  color: Colors.transparent,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: getImage(angle),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
