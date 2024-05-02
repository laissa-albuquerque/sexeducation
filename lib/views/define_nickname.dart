import 'package:flutter/material.dart';

import '../components/global.dart';
import '../services/authentication.dart';
import 'define_avatar.dart';

class DefineNicknameScreen extends StatefulWidget {
  const DefineNicknameScreen({super.key});

  static String id = 'nickname_view';

  @override
  State<StatefulWidget> createState() => _DefineNicknameScreen();
}

class _DefineNicknameScreen extends State<DefineNicknameScreen> {
  TextEditingController _nicknameController = TextEditingController();

  _enviar() {
    String nickname = _nicknameController.text;
    AuthService authService = AuthService();
    authService.updateNickname(nickname);

    if (nickname.isNotEmpty) {
      Navigator.pushNamed(context, DefineAvatarScreen.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
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
            child: Stack(
              children: [
                Positioned(
                    top: 0,
                    left: 0,
                    child: Image.asset('assets/images/stars.png',
                        width: 450, height: 450)),
                Positioned(
                    top: 450,
                    left: 0,
                    child: Image.asset('assets/images/stars.png',
                        width: 450, height: 450)),
                Positioned(
                    top: 590,
                    left: -50,
                    child: Image.asset('assets/images/menino1.png',
                        width: 300, height: 300)),
                Positioned(
                    top: -10,
                    left: 120,
                    child: Image.asset('assets/images/menina2.png',
                        width: 350, height: 350)),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Container(
                              width: 360,
                              height: MediaQuery.of(context).size.height,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12.0, horizontal: 16.0),
                              decoration: const BoxDecoration(
                                color: Colors.transparent,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Olá',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 58,
                                      fontFamily: 'KleeOne',
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  const Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8.0, vertical: 0),
                                    child: Text(
                                      'Chegou a hora de sabermos seu apelido favorito:',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'KleeOne',
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0, vertical: 0),
                                    child: TextField(
                                      controller: _nicknameController,
                                      style:
                                          const TextStyle(color: Colors.white),
                                      decoration: const InputDecoration(
                                        labelText: 'Digite seu apelido',
                                        labelStyle:
                                            TextStyle(color: Colors.white60),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 32),
                                  Hero(
                                    tag: 'avatar',
                                    child: CusttomButton(
                                        buttonText: 'PRÓXIMO',
                                        onPressed: _enviar,
                                        colors: const [
                                          Color(0xFFbfcaff),
                                          Color(0xFFb9c5ff),
                                          Color(0xFFb3c0ff),
                                          Color(0xFFaebbff),
                                          Color(0xFFa8b7ff),
                                          Color(0xFFa2b2ff),
                                          Color(0xFF9cadff),
                                          Color(0xFF96a8ff),
                                        ]),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
