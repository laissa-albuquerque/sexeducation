import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sexeducation/views/define_nickname.dart';

class InformationScreen extends StatefulWidget {
  const InformationScreen({super.key});

  static String id = 'information_view';

  @override
  State<StatefulWidget> createState() => _InformationScreen();
}

class _InformationScreen extends State<InformationScreen> {
  late Timer _timer;
  int _countdown = 12;

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
                  pageBuilder: (_, __, ___) => DefineNicknameScreen(),
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
                    top: 30,
                    left: -60,
                    child: Image.asset('assets/images/menino1.png',
                        width: 300, height: 300)),
                Positioned(
                    top: 500,
                    left: 120,
                    child: Transform.rotate(
                      angle: 45 * 3.1415926535 / 60,
                      child: Image.asset('assets/images/menina2.png',
                          width: 350, height: 350),
                    )),
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
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                                    child: Text(
                                      'Nossa turminha recomenda que esse aplicativo seja utilizado '
                                          'com auxilio de um adulto bem legal, para que juntos possamos aprender mais sobre nosso corpo.',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontFamily: 'KleeOne',
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 16),
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
