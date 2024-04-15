import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:sexeducation/database/user_dao.dart';
import 'package:sexeducation/models/user.dart';
import 'package:sexeducation/view/information.dart';

import '../components/global.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static String id = 'login_view';

  @override
  State<LoginScreen> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Color(0xff0E0019),
        body: ListView(
          padding: const EdgeInsets.fromLTRB(0, 400, 0, 0),
          shrinkWrap: true,
          reverse: true,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Stack(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Color(0xffffffff),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Login",
                              style: TextStyle(
                                fontFamily: 'Fredoka',
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff0E0019),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 0, 0, 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Email",
                                    style: TextStyle(
                                      fontFamily: 'Fredoka',
                                      fontSize: 18,
                                      color: Color(0xff8d8d8d),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                              MyTextField(
                                onChanged: (() {}),
                                  //     validateEmail(emailController.text);
                                  //   }),
                                  controller: null,
                                  hintText: "example@email.com",
                                  obscureText: false,
                                  prefixIcon: const Icon(Icons.mail_outline),
                              ),
                                  // const Padding(
                                  //   padding:
                                  //   EdgeInsets.fromLTRB(8, 0, 0, 0),
                                  //   child: Text(
                                  //     'error',
                                  //     style: TextStyle(
                                  //       fontFamily: 'Fredoka',
                                  //       fontSize: 12,
                                  //       color: Colors.red,
                                  //     ),
                                  //   ),
                                  // ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    "Password",
                                    style: TextStyle(
                                      fontFamily: 'Fredoka',
                                      fontSize: 18,
                                      color: Color(0xff8d8d8d),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                              const MyTextField(
                                controller: null,
                                hintText: "**************",
                                obscureText: true,
                                prefixIcon: Icon(Icons.lock_outline),
                              ),
                                  const SizedBox(
                                    height: 26,
                                  ),
                                  Center(
                                    child: Hero(
                                      tag: 'login_btn',
                                      child: CusttomButton(
                                        buttonText: 'ENTRAR',
                                        onPressed: () {
                                          Navigator.pushNamed(context, InformationScreen.id);
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
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  // Padding(
                                  //   padding:
                                  //   const EdgeInsets.fromLTRB(35, 0, 0, 0),
                                  //   child: Row(
                                  //     children: [
                                  //       Text("Belum punya akun?",
                                  //           style: GoogleFonts.poppins(
                                  //             fontSize: 15,
                                  //             color: HexColor("#8d8d8d"),
                                  //           )),
                                  //       TextButton(
                                  //         child: Text(
                                  //           "Daftar",
                                  //           style: GoogleFonts.poppins(
                                  //             fontSize: 15,
                                  //             color: HexColor("#44564a"),
                                  //           ),
                                  //         ),
                                  //         onPressed: () => Navigator.push(
                                  //           context,
                                  //           MaterialPageRoute(
                                  //             builder: (context) =>
                                  //             const SignUpScreen(),
                                  //           ),
                                  //         ),
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Transform.translate(
                      offset: const Offset(0, -400),
                      child: Image.asset(
                        'assets/images/background-login.png',
                        scale: 1.5,
                        width: double.infinity,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
