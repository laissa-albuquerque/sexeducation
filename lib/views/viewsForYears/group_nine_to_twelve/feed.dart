import 'package:flutter/material.dart';
import 'package:sexeducation/components/card_feed.dart';
import 'package:sexeducation/views/viewsForYears/group_nine_to_twelve/group_two_menu.dart';

import '../../../services/authentication.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  static String id = 'feed_view';

  @override
  State<StatefulWidget> createState() => _FeedScreen();
}

class _FeedScreen extends State<FeedScreen> {
  String? userImageUrl;
  String? userNickname;
  bool _showImage = true;
  bool _clickLike = false;
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

  _buttonLike() {
    if(!_clickLike) {
      _clickLike = true;
      print('Curtida ativada');
    } else {
      _clickLike = false;
      print('Curtida desativada');
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
                                  'um galáxia inteira de informações e curiosidades sobre nós mesmos e sobre'
                                  ' nosso corpo"',
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
              CardFeed(img: 'assets/images-feed/feed1.png',
                  text: 'O ciclo menstrual é um processo natural pelo qual o corpo da menina passa todos os meses. '
                      'Ele é uma parte importante do crescimento e acontece para preparar o corpo para uma possível '
                      'gravidez no futuro. Role o feed para entender como ele funciona de maneira simples: ',
                  like: false, onTap: () {  },),
              const SizedBox(height: 22),
              CardFeed(img: 'assets/images-feed/feed2.png',
                text: 'O ciclo se inicia quando a menina menstrua (sangra) pela primeira vez.\n\n'
                    'Mas o que é a menstruação?\n'
                    'A menstruação é quando a camada interna do útero (endométrio), que se formou no ciclo anterior, '
                    'se desintegra e é expelida do corpo através da vagina. Isso acontece porque o óvulo não foi fertilizado '
                    'e o corpo não precisa mais dessa camada espessa.\n',
                like: false, onTap: () {  },),
              const SizedBox(height: 22),
              CardFeed(img: 'assets/images-feed/feed3.png',
                text: 'A partir daí o clico vai se dividr em três fases:\n'
                    '- Fase folicular\n'
                    '- Fase ovulatória\n'
                    '- Fase lútea',
                like: false, onTap: () {  },),
              const SizedBox(height: 22),
              CardFeed(img: 'assets/images-feed/feed4.png',
                text: 'É importante saber que a fase folicular é a primeira parte do ciclo e inlcui o período menstrual.\n\n'
                'A fase folicular começa no primeiro dia da menstruação e dura '
                    'até a ovulação. Essa fase geralmente dura cerca de 14 dias, mas pode variar.\n\n'
                    'Durante esta fase, o corpo começa a preparar um novo óvulo para ser liberado. '
                    'O cérebro envia sinais aos ovários para que eles produzam folículos, que são pequenas bolsas cheias de líquido que contêm os óvulos.\n\n'
                    'A fase folicular é essencial para reiniciar o ciclo menstrual e '
                    'preparar o corpo para uma nova possibilidade de gravidez.',
                like: false, onTap: () {  },),
              const SizedBox(height: 22),
              CardFeed(img: 'assets/images-feed/feed5.png',
                text: 'Cerca de duas semanas após o início da menstruação, o óvulo está pronto e '
                    'é liberado do ovário. Isso se chama ovulação. '
                    'O óvulo então se move para a trompa de Falópio, onde pode encontrar '
                    'um espermatozoide (célula masculina) se a menina tiver relações sexuais.',
                like: false, onTap: () {  },),
              const SizedBox(height: 22),
              CardFeed(img: 'assets/images-feed/feed6.png',
                text: 'Durante a fase lútea, o corpo da menina se prepara para uma possível gravidez. '
                    'Após a ovulação, o ovário libera hormônios, principalmente a progesterona, que ajudam a '
                    'tornar a camada do útero (onde um bebê cresceria) mais espessa e pronta para nutrir um possível bebê.',
                like: false, onTap: () {  },),
              const SizedBox(height: 22),
              CardFeed(img: 'assets/images-feed/feed7.png',
                text: 'Se o óvulo não encontrar um espermatozoide e não for fertilizado, '
                    'o corpo entende que não há gravidez. Então, os níveis dos '
                    'hormônios progesterona e estrogênio começam a cair.\n\n'
                    ' Toda essa variação hormonal pode trazer uma série de sensações na mulher. Esses sensações são os sintomas da TPM.\n\n'
                    'A TPM, ou Tensão Pré-Menstrual, são os sintomas que algumas meninas e mulheres podem sentir antes de começarem a menstruar. '
                    'Esses sintomas acontecem durante a fase lútea, especialmente nos dias finais, antes da menstruação começar.',
                like: false, onTap: () {  },)
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
              Navigator.pushNamed(context, GroupTwoScreen.id);
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
