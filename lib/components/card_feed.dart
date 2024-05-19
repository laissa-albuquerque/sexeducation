import 'package:flutter/material.dart';

class CardFeed extends StatefulWidget {
  final String img;
  final String text;
  final VoidCallback onTap;
  final bool like;

  const CardFeed({
    Key? key,
    required this.img,
    required this.text,
    required this.onTap,
    required this.like,
  }) : super(key: key);

  @override
  _CardFeedState createState() => _CardFeedState();
}

class _CardFeedState extends State<CardFeed> {
  bool _clickLike = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 380,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.transparent, // Cor da borda
              width: 2, // Largura da borda
            ),
            borderRadius: BorderRadius.circular(10),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Container(
                  width: 340,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(widget.img),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _clickLike = !_clickLike;
                      });
                      widget.onTap();
                    },
                    child: Image.asset(
                      _clickLike
                          ? 'assets/images/like-true.png'
                          : 'assets/images/like-false.png',
                      width: 35,
                      height: 35,
                    ),
                  ),
                  const SizedBox(width: 16),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 26),
                child: Text(
                  widget.text,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    decoration: TextDecoration.none,
                    fontFamily: 'KleeOne',
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
