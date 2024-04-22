import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:sexeducation/views/age_options_menu.dart';
import 'package:sexeducation/views/define_avatar.dart';
import 'package:sexeducation/views/information.dart';
import 'package:sexeducation/views/login.dart';
import 'package:sexeducation/views/register.dart';
import 'package:sexeducation/views/define_nickname.dart';
import 'components/global.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {LoginScreen.id: (context) => const LoginScreen(),
        RegisterScreen.id: (context) => const RegisterScreen(),
        InformationScreen.id: (context) => const InformationScreen(),
        DefineNicknameScreen.id: (context) => const DefineNicknameScreen(),
        DefineAvatarScreen.id: (context) => const DefineAvatarScreen(),
        AgeOptionsMenuScreen.id: (context) => const AgeOptionsMenuScreen(),
      },
      home: Scaffold(
        body: Welcome(),
      ),
    );
  }
}

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Imagem de fundo
        Image.asset(
          'assets/images/background.png',
          fit: BoxFit.cover,
        ),
        // Conteúdo centralizado
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Logo(width: 360, height: 224, fontSize: 38.0),
            const SizedBox(
              height: 42,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: 'login_btn',
                  child: CusttomButton(
                    buttonText: 'ENTRAR',
                    onPressed: () {
                      Navigator.pushNamed(context, LoginScreen.id);
                    },
                    colors: const [
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
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  child: Hero(
                    tag: 'register_btn',
                    child: CusttomButton(
                      buttonText: 'CADASTRAR',
                      onPressed: () {
                        Navigator.pushNamed(context, RegisterScreen.id);
                      },
                      colors: const [
                        Color(0xFF2d1640),
                        Color(0xFF2f1444),
                        Color(0xFF301349),
                        Color(0xFF32104d),
                        Color(0xFF330e52),
                        Color(0xFF340b56),
                        Color(0xFF36075b),
                        Color(0xFF37035f),
                    
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
