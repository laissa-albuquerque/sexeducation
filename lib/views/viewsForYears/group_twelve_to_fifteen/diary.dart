import 'package:flutter/material.dart';
import 'package:sexeducation/views/viewsForYears/group_twelve_to_fifteen/group_three_menu.dart';
import 'package:sexeducation/views/viewsForYears/group_twelve_to_fifteen/pages/page_one.dart';

import '../../../services/authentication.dart';

class DiaryScreen extends StatefulWidget {
  const DiaryScreen({super.key});

  static String id = 'diary_view';

  @override
  State<StatefulWidget> createState() => _DiaryScreen();
}

class _DiaryScreen extends State<DiaryScreen> {
  String? userImageUrl;
  String? userNickname;
  bool _showImage = true;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _loadNickname();
    _loadAvatar();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
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
        Center(
          child: ListView(
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
                      height: 120,
                      margin: const EdgeInsets.fromLTRB(0, 50, 0, 0),
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
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(125, 4, 12, 4),
                            child: Text(
                              '"Olá ${_getNickname(userNickname ?? '')}! Clique no play para visualizar o conteúdo do diário e arraste para o lado'
                                  ' para visualizar as páginas do diário."',
                              textAlign: TextAlign.justify,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontFamily: 'KleeOne',
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 12),
              Column(
                children: [
                  Container(
                    width: 380,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.transparent,
                        width: 2,
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
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                          child: Text('Diário, página 1: Meu Corpo',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'KleeOne',
                                  fontSize: 20,
                                  decoration: TextDecoration.none)),
                        ),
                        const Divider(),
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
                              child: Image.asset(
                                  'assets/images-diary/my-body.png'),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(16, 8, 16, 26),
                          child: Text(
                            'Nessa idade, é normal ter muitas dúvidas e sentir vergonha do próprio corpo. '
                            'O que os outros dizem ou pensam sobre você pode afetar como você se sente, '
                            'sua autoimagem e até seu comportamento. '
                            'Mas é importante lembrar que todo mundo passa por isso e que você não está sozinho.',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              decoration: TextDecoration.none,
                              fontFamily: 'KleeOne',
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 16, 16),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, PageOneScreen.id);
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment(0.8, 1),
                                  colors: [
                                    Color(0xFFbfcaff),
                                    Color(0xFFb9c5ff),
                                    Color(0xFFb3c0ff),
                                    Color(0xFFaebbff),
                                    Color(0xFFa8b7ff),
                                    Color(0xFFa2b2ff),
                                    Color(0xFF9cadff),
                                    Color(0xFF96a8ff),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(
                                    25.0), // Borda arredondada
                              ),
                              child: Center(
                                child:
                                    Image.asset('assets/images/play-diary.png'),
                              ),
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
        ),
        Positioned(
          top: 40,
          left: 0,
          child: AnimatedOpacity(
            opacity: _showImage ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 200),
            child: Image.asset(
              _getUserImageProvider(
                  userImageUrl ?? 'assets/images/default_user.png'),
              width: 150,
              height: 150,
            ),
          ),
        ),
        Positioned(
          bottom: 32,
          left: 20,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, GroupThreeScreen.id);
            },
            backgroundColor: const Color(0xffBFCAFF),
            shape: const CircleBorder(),
            child: const Icon(Icons.keyboard_arrow_left,
                color: Color(0xff37035F), size: 32), // Cor de fundo do botão
          ),
        )
      ],
    );
  }
}
