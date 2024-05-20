import 'package:flutter/material.dart';
import 'package:sexeducation/views/viewsForYears/group_five_to_eight/kids_group_menu.dart';
import 'package:sexeducation/views/viewsForYears/group_nine_to_twelve/group_two_menu.dart';
import 'package:sexeducation/views/viewsForYears/group_twelve_to_fifteen/group_three_menu.dart';

class AgeOptionsMenuScreen extends StatefulWidget {
  const AgeOptionsMenuScreen({super.key});

  static String id = 'ageoptions_view';

  @override
  State<AgeOptionsMenuScreen> createState() => _AgeOptionsMenuScreen();
}

class _AgeOptionsMenuScreen extends State<AgeOptionsMenuScreen> {
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
                Column(
                  children: [
                    Column(
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
                                  const Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8.0, vertical: 0),
                                    child: Text(
                                      'Escolha sua idade:',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          fontSize: 28,
                                          fontFamily: 'KleeOne',
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  const SizedBox(height: 32),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                          width: 360,
                                          height: 120,
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 12.0, horizontal: 33),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(20.0)),
                                            border: Border.all(
                                              color: const Color(0xFF6568AA),
                                              width: 3.0,
                                            ),
                                          ),
                                          child: Center(
                                            child: TextButton(
                                              onPressed: () {
                                                Navigator.pushNamed(context, KidsGroupOneScreen.id);
                                              },
                                              child: const Text(
                                                '5 - 8 anos',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: 29,
                                                  fontFamily: 'KleeOne',
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          )),
                                      const SizedBox(
                                        height: 21,
                                      ),
                                    ],
                                  ),
                                  Container(
                                      width: 360,
                                      height: 120,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12.0, horizontal: 33),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        const BorderRadius.all(
                                            Radius.circular(20.0)),
                                        border: Border.all(
                                          color: const Color(0xFF6568AA),
                                          width: 3.0,
                                        ),
                                      ),
                                      child: Center(
                                        child: TextButton(
                                          onPressed: () { Navigator.pushNamed(context, GroupTwoScreen.id); },
                                          child: const Text(
                                            '9 - 12 anos',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 29,
                                              fontFamily: 'KleeOne',
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      )),
                                  const SizedBox(
                                    height: 21,
                                  ),
                                  Container(
                                      width: 360,
                                      height: 120,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12.0, horizontal: 33),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        const BorderRadius.all(
                                            Radius.circular(20.0)),
                                        border: Border.all(
                                          color: const Color(0xFF6568AA),
                                          width: 3.0,
                                        ),
                                      ),
                                      child: Center(
                                        child: TextButton(
                                          onPressed: () { Navigator.pushNamed(context, GroupThreeScreen.id); },
                                          child: const Text(
                                            '12 - 15 anos',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 29,
                                              fontFamily: 'KleeOne',
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      )),
                                  const SizedBox(
                                    height: 21,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
