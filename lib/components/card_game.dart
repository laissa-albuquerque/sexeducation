import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sexeducation/controllers/memory_game_controller.dart';
import 'package:sexeducation/models/card.dart';

class CardGame extends StatefulWidget {
  final CardOptionModel cardOption;

  const CardGame({
    Key? key,
    required this.cardOption,
  }) : super(key: key);

  @override
  State<CardGame> createState() => _CardGameState();
}

class _CardGameState extends State<CardGame> with SingleTickerProviderStateMixin {
  late final AnimationController animation;
  late final MemoryGameController controller = MemoryGameController();

  @override
  void initState() {
    super.initState();
    controller.initializeGame();
    animation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
  }

  @override
  void dispose() {
    animation.dispose();
    super.dispose();
  }

  AssetImage getImage(double angulo) {
    if (angulo > 0.5 * pi) {
      print('assets/cards/${widget.cardOption.urlCard}');
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
        !game.fullGame) {
      animation.forward();
      game.choiceCard(widget.cardOption);
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
        final angulo = animation.value * pi;
        final transform = Matrix4.identity()
          ..setEntry(3, 2, 0.002)
          ..rotateY(angulo);

        return GestureDetector(
          onTap: () => flipCard(),
          child: Transform(
            transform: transform,
            alignment: Alignment.center,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: getImage(angulo),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}