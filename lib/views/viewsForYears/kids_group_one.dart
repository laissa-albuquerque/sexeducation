import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sexeducation/views/viewsForYears/kids_videos.dart';
import '../../components/global.dart';
import '../../services/authentication.dart';

class KidsGroupOneScreen extends StatefulWidget {
  const KidsGroupOneScreen({super.key});

  static String id = 'kids_one_view';

  @override
  State<StatefulWidget> createState() => _KidsGroupOneScreen();
}

class _KidsGroupOneScreen extends State<KidsGroupOneScreen> {
  String? userImageUrl;
  String? userNickname;

  @override
  void initState() {
    super.initState();
    _loadNickname();
    _loadAvatar();
  }

  Future<void> _loadNickname() async {
    userNickname = await AuthService().getNickname();
    setState(() {});
  }

  Future<void> _loadAvatar() async {
    userImageUrl = await AuthService().getImageUser();
    setState(() {});
  }

  String _getUserImageProvider(String userImageUrl) {
    if (userImageUrl.isNotEmpty) {
      return userImageUrl;
    }

    return '';
  }

  String _getNickname(String userNickname) {
    if (userNickname.isNotEmpty) {
      return userNickname;
    }

    return '';
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
                ]), // Borda arredondada
          ),
        ),
        Image.asset('assets/images/stars-two.png', fit: BoxFit.fitHeight),
        Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: 380,
                  height: 400,
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
                        margin: const EdgeInsets.fromLTRB(0, 62, 0, 30),
                        width: 380,
                        height: 70,
                        color: Color(0xffBFCAFF),
                        child: Center(
                          child: Text(
                            'Bem-vindo(a), ${_getNickname(userNickname ?? '')}',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 32,
                              fontFamily: 'KleeOne',
                              color: Color(0xff0E0019),
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                      ),
                      const Material(
                        color: Colors.transparent,
                        child: Text(
                          'você pode navegar por:',
                          style: TextStyle(
                              fontSize: 22,
                              fontFamily: 'KleeOne',
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, KidsVideoScreen.id);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(20.0)),
                                border: Border.all(
                                    color: Colors.transparent, width: 3.0),
                                gradient: const LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment(0.8, 1),
                                    colors: <Color>[
                                      Color(0xFF241233),
                                      Color(0xFF281439),
                                      Color(0xFF2d1640),
                                      Color(0xFF311846),
                                      Color(0xFF361b4d),
                                      Color(0xFF3b1d53),
                                      Color(0xFF3f1f5a),
                                      Color(0xFF442161),
                                    ]),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xff12091a).withOpacity(0.9),
                                    spreadRadius: 3,
                                    blurRadius: 10,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: const CustomAvatar(
                                  width: 80,
                                  height: 80,
                                  urlImage: 'assets/images/play.png'),
                            ),
                          ),
                          TextButton(
                            onPressed: null,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(20.0)),
                                border: Border.all(
                                    color: Colors.transparent, width: 3.0),
                                gradient: const LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment(0.8, 1),
                                    colors: <Color>[
                                      Color(0xFF241233),
                                      Color(0xFF281439),
                                      Color(0xFF2d1640),
                                      Color(0xFF311846),
                                      Color(0xFF361b4d),
                                      Color(0xFF3b1d53),
                                      Color(0xFF3f1f5a),
                                      Color(0xFF442161),
                                    ]),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xff12091a).withOpacity(0.9),
                                    spreadRadius: 3,
                                    blurRadius: 10,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: const CustomAvatar(
                                  width: 80,
                                  height: 80,
                                  urlImage: 'assets/images/game.png'),
                            ),
                          ),
                          TextButton(
                            onPressed: null,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(20.0)),
                                border: Border.all(
                                    color: Colors.transparent, width: 3.0),
                                gradient: const LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment(0.8, 1),
                                    colors: <Color>[
                                      Color(0xFF241233),
                                      Color(0xFF281439),
                                      Color(0xFF2d1640),
                                      Color(0xFF311846),
                                      Color(0xFF361b4d),
                                      Color(0xFF3b1d53),
                                      Color(0xFF3f1f5a),
                                      Color(0xFF442161),
                                    ]),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xff12091a)
                                        .withOpacity(0.9),
                                    spreadRadius: 3,
                                    blurRadius: 10,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: const CustomAvatar(
                                  width: 80,
                                  height: 80,
                                  urlImage: 'assets/images/achievements.png'),
                            ),
                          ),
                        ],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 52),
                          Text('vídeos',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'KleeOne',
                                  color: Colors.white70,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.none)),
                          SizedBox(width: 63),
                          Text('jogos',
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'KleeOne',
                                color: Colors.white70,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.none,
                              )),
                          SizedBox(width: 42),
                          Text('conquistas',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'KleeOne',
                                  color: Colors.white70,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.none)),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 50,
          left: 75,
          child: Image.asset(
            _getUserImageProvider(
                userImageUrl ?? 'assets/images/default_user.png'),
            width: 250,
            height: 250,
          ),
        ),
      ],
    );
  }
}
