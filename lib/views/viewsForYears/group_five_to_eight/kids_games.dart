import 'package:flutter/material.dart';
import 'package:sexeducation/views/viewsForYears/group_five_to_eight/games/correct_cards.dart';
import 'package:sexeducation/views/viewsForYears/group_five_to_eight/games/memory_game.dart';

class KidsGameScreen extends StatefulWidget {
  const KidsGameScreen({super.key});

  static String id = 'kids_games_view';

  @override
  State<StatefulWidget> createState() => _KidsGameScreen();
}

class _KidsGameScreen extends State<KidsGameScreen> {
  bool _showImage = true;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.offset > 1 && _showImage) {
      setState(() {
        _showImage = false;
      });
    } else if (_scrollController.offset <= 0 && !_showImage) {
      setState(() {
        _showImage = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                ]),
          ),
        ),
        Image.asset('assets/images/stars-two.png', fit: BoxFit.fitHeight),
        ListView(
          controller: _scrollController,
          padding: const EdgeInsets.all(20),
          children: [
            Column(
              children: [
                AnimatedOpacity(
                  opacity: _showImage ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 200),
                  child: Container(
                    width: 380,
                    margin: const EdgeInsets.fromLTRB(0, 210, 0, 0),
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20.0)),
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
                          margin: EdgeInsets.fromLTRB(12, 50, 12, 12),
                          child: const Text(
                            'Nesta seção vamos colocar em'
                            ' prática tudo que aprendemos nos vídeos."',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontFamily: 'KleeOne',
                              decoration: TextDecoration.none,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20.0)),
                        border:
                            Border.all(color: Colors.transparent, width: 3.0),
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
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, MemoryGameScreen.id);
                        },
                        child:
                            Image.asset('assets/images-games/memory-game.png'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 12),
                Row(
                  children: [
                    Container(
                      width: 140,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20.0)),
                        border:
                            Border.all(color: Colors.transparent, width: 3.0),
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
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Image.asset(
                                'assets/images-games/image-default.png',
                                width: 150,
                                height: 150,
                                fit: BoxFit.fitHeight),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.5),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20.0)),
                              border: Border.all(
                                  color: Colors.transparent, width: 3.0),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.lock,
                                color: Colors.white,
                                size: 40,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                Container(
                  width: 360,
                  height: 200,
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
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Image.asset(
                            'assets/images-games/image-default.png'),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20.0)),
                          border:
                              Border.all(color: Colors.transparent, width: 3.0),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.lock,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        Positioned(
          top: 0,
          left: 30,
          child: AnimatedOpacity(
            opacity: _showImage ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 200),
            child: Image.asset(
              'assets/images-games/book.png',
              width: 350,
              height: 350,
            ),
          ),
        ),
      ],
    );
  }
}
