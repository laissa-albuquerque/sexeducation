import 'package:flutter/material.dart';
import 'package:sexeducation/views/age_options_menu.dart';

import '../components/global.dart';
import '../services/authentication.dart';

class DefineAvatarScreen extends StatefulWidget {
  const DefineAvatarScreen({super.key});

  static String id = 'avatar_view';

  @override
  State<StatefulWidget> createState() => _DefineAvatarScreen();
}

class _DefineAvatarScreen extends State<DefineAvatarScreen> {
  String? userNickname = '';
  String? userImageUrl;
  bool _isDataLoaded = false;

  @override
  void initState() {
    super.initState();
    _loadNickname();
  }

  Future<void> _loadNickname() async {
    userNickname = await AuthService().getNickname();
    setState(() {
      _isDataLoaded = true;
    });
  }

  String _getNickname(String userNickname) {
    if (userNickname.isNotEmpty)
      return userNickname;
    else
      return '';
  }

  void _handleAvatarSelection(String selectedImagePath) {
    userImageUrl = '$selectedImagePath';
  }

  _enviar() {
    if (_isDataLoaded) {
      AuthService authService = AuthService();
      authService.updateAvatar(userImageUrl!);
      Navigator.pushNamed(context, AgeOptionsMenuScreen.id);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content:
              Text('Aguarde enquanto as informações estão sendo carregadas...'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    _loadNickname();
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
                                  Text(
                                    'Olá, ${_getNickname(userNickname ?? '')}',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 48,
                                      fontFamily: 'KleeOne',
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  const Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8.0, vertical: 0),
                                    child: Text(
                                      'Agora vamos escolher seu avatar:',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontFamily: 'KleeOne',
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  const SizedBox(height: 32),
                                  Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          _buildAvatarOption(
                                              'assets/avatars/avatar-kid-boy1.png'),
                                          const SizedBox(width: 20),
                                          _buildAvatarOption(
                                              'assets/avatars/avatar-kid-girl1.png'),
                                          const SizedBox(width: 20),
                                          _buildAvatarOption(
                                              'assets/avatars/avatar-kid-boy2.png'),
                                          const SizedBox(width: 20),
                                          _buildAvatarOption(
                                              'assets/avatars/avatar-kid-girl2.png'),
                                        ],
                                      ),
                                      SizedBox(height: 16),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          _buildAvatarOption(
                                              'assets/avatars/man-avatar1.png'),
                                          const SizedBox(width: 20),
                                          _buildAvatarOption(
                                              'assets/avatars/girl-avatar1.png'),
                                          const SizedBox(width: 20),
                                          _buildAvatarOption(
                                              'assets/avatars/man-avatar2.png'),
                                          const SizedBox(width: 20),
                                          _buildAvatarOption(
                                              'assets/avatars/girl-avatar2.png'),
                                        ],
                                      ),
                                      const SizedBox(height: 16),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          _buildAvatarOption(
                                              'assets/avatars/cute-avatar1.png'),
                                          const SizedBox(width: 20),
                                          _buildAvatarOption(
                                              'assets/avatars/cute-avatar2.png'),
                                          const SizedBox(width: 20),
                                          _buildAvatarOption(
                                              'assets/avatars/cute-avatar3.png'),
                                          const SizedBox(width: 20),
                                          _buildAvatarOption(
                                              'assets/avatars/cute-avatar4.png'),
                                        ],
                                      )
                                    ],
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
                                          ]))
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

  Widget _buildAvatarOption(String imagePath) {
    bool isSelected = userImageUrl == '$imagePath';

    return GestureDetector(
        onTap: () {
          _handleAvatarSelection(imagePath);
        },
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white60,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: isSelected ? Color(0xffEEB820) : Colors.transparent,
              width: 4,
            ),
          ),
          child: CustomAvatar(width: 55, height: 55, urlImage: '$imagePath'),
        ));
  }
}
