import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sexeducation/controllers/correct_cards_controller.dart';
import 'package:sexeducation/models/card.dart';

class CardSelectionGame extends StatefulWidget {
  final CardOptionModel cardOption;

  const CardSelectionGame({
    Key? key,
    required this.cardOption,
  }) : super(key: key);

  @override
  State<CardSelectionGame> createState() => _CardSelectionGame();
}

class _CardSelectionGame extends State<CardSelectionGame>
    with SingleTickerProviderStateMixin {
  late final AnimationController animation;
  late final CorrectCardsGameController controller =
      context.read<CorrectCardsGameController>();

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
    return AssetImage('${widget.cardOption.urlCard}');
  }

  verseOrReverse() {
    if (!animation.isAnimating && widget.cardOption.selected)
      reverseCard(widget.cardOption);
    if (!animation.isAnimating && !widget.cardOption.selected)
      flipCard(widget.cardOption);
  }

  flipCard(CardOptionModel card) async {
    final game = context.read<CorrectCardsGameController>();

    animation.forward();
    game.choiceCard(widget.cardOption);
  }

  reverseCard(CardOptionModel card) {
    final game = context.read<CorrectCardsGameController>();

    animation.reverse();
    game.choiceCard(widget.cardOption);
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
          onTap: () => verseOrReverse(),
          child: Transform(
            transform: transform,
            alignment: Alignment.center,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 5,
                  color: widget.cardOption.selected
                      ? Colors.white
                      : Colors.transparent,
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
