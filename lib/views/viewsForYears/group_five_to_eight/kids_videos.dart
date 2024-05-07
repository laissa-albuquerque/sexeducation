import 'package:flutter/material.dart';
import 'package:sexeducation/components/video_play_view.dart';

import '../../../services/authentication.dart';
import 'kids_group_menu.dart';

class KidsVideoScreen extends StatefulWidget {
  const KidsVideoScreen({super.key});

  static String id = 'kids_videos_view';

  @override
  State<StatefulWidget> createState() => _KidsVideoScreen();
}

class _KidsVideoScreen extends State<KidsVideoScreen> {
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
                            margin: const EdgeInsets.fromLTRB(125, 4, 12, 4),
                            child: Text(
                              '"Olá ${_getNickname(userNickname ?? '')}! Aqui você vai encontrar '
                                  'diversos vídeos que vão te ajudar nessa jornada de descobrir sobre a  '
                                  'galáxia que habita em você."',
                              textAlign: TextAlign.justify,
                              style: const TextStyle(
                                fontSize: 14,
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
              const SizedBox(height: 22),
              const VideoPlayerView(
                  url: 'assets/videos/desbravando-nosso-corpo-H1.mp4',
                  nameVideo: 'Desbravando nosso corpo'),
              const SizedBox(height: 28),
              const VideoPlayerView(
                  url: 'assets/videos/os-segredos-do-meu-corpinho-H2.mp4',
                  nameVideo: 'Os segredos do meu corpinho'),
              const SizedBox(height: 28),
              const VideoPlayerView(
                  url: 'assets/videos/a-brincadeira-do-pode-ou-nao-pode-H3.mp4',
                  nameVideo: 'A brincadeira do pode ou não pode'),
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
              Navigator.pushNamed(context, KidsGroupOneScreen.id);
            },
            backgroundColor: const Color(0xffBFCAFF),
            shape: const CircleBorder(),
            child: const Icon(Icons.keyboard_arrow_left, color: Color(0xff37035F), size: 32),// Cor de fundo do botão
          ),
        )
      ],
    );
  }
}
