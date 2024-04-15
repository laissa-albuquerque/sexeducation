import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sexeducation/components/global.dart';
import 'package:sexeducation/view/age_options_menu.dart';

class InformationScreen extends StatefulWidget {
  const InformationScreen({super.key});

  static String id = 'information_view';

  @override
  State<StatefulWidget> createState() => _InformationScreen();
}

class _InformationScreen extends State<InformationScreen> {
  late Timer _timer;
  int _countdown = 20;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  _startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        setState(() {
          if (_countdown < 1) {
            _timer.cancel();
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                  transitionDuration: Duration(milliseconds: 500),
                  pageBuilder: (_, __, ___) => AgeOptionsMenuScreen(),
                  transitionsBuilder: (_, animation, __, child) {
                    return FadeTransition(opacity: animation, child: child);
                  }),
            );
          } else {
            _countdown--;
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: [
        Image.asset('assets/images/background.png', fit: BoxFit.cover),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3.5, sigmaY: 3.5),
          child: Container(
            color: Colors.white.withOpacity(0.0),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Logo(width: 360, height: 106, fontSize: 26.0),
            const SizedBox(
              height: 42,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    width: 360,
                    height: 400,
                    padding: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: const Color(0xFF0E0019),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20.0)),
                      border: Border.all(
                        color: const Color(0xFF6568AA),
                        width: 3.0,
                      ),
                    ),
                    child: const Text(
                      'Lipe, Ana e sua turminha recomendam que esse aplicativo seja utilizado '
                      'com auxilio de um adulto bem legal, para que juntos possamos aprender mais sobre nosso corpo.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'KleeOne',
                        color: Color(0xffC1CBFF),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
        Transform.translate(
          offset: const Offset(-60, 215),
          child: Image.asset(
            'assets/images/menino.png',
            scale: 3.5,
            width: double.infinity,
          ),
        ),
        Transform.translate(
          offset: const Offset(80, 200),
          child: Image.asset(
            'assets/images/menina.png',
            scale: 3.5,
            width: double.infinity,
          ),
        ),
      ],
    ));
  }
}
