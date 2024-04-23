import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
                  width: 360,
                  height: 360,
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
                        margin: const EdgeInsets.symmetric(
                            vertical: 54, horizontal: 0),
                        width: 360,
                        height: 70,
                        color: const Color(0xffBFCAFF),
                        child: Center(
                          child: Text(
                            'Bem-vindo(a), ${_getNickname(userNickname ?? '')}',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 32,
                              fontFamily: 'KleeOne',
                              color: Color(0xff0E0019),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            child: Container(
                              height: 88,
                              width: 88,
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
                                  width: 110,
                                  height: 110,
                                  urlImage: 'assets/images/play.png'),
                            ),
                          ),
                          SizedBox(width: 20),
                          GestureDetector(
                            child: Container(
                              height: 88,
                              width: 88,
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
                                  width: 110,
                                  height: 110,
                                  urlImage: 'assets/images/game.png'),
                            ),
                          ),
                          SizedBox(width: 20),
                          GestureDetector(
                            child: Container(
                              height: 88,
                              width: 88,
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
                                    color: Color(0xff12091a).withOpacity(0.5),
                                    spreadRadius: 3,
                                    blurRadius: 10,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: const CustomAvatar(
                                  width: 110,
                                  height: 110,
                                  urlImage: 'assets/images/achievements.png'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 63,
          left: 70,
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
