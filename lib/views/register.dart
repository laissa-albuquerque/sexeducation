import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sexeducation/database/user_dao.dart';
import 'package:sexeducation/models/user.dart';
import 'package:sexeducation/views/login.dart';

import '../components/global.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  static String id = 'register_view';

  @override
  State<RegisterScreen> createState() => _RegisterScreen();
}

class _RegisterScreen extends State<RegisterScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  UserDao userController = UserDao();

  _register() async {
    String name = _nameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;
    UserModel user = UserModel(name: name, email: email);
    userController.insert(user);

    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await Future.delayed(const Duration(seconds: 1), () {
        Navigator.pushNamed(context, LoginScreen.id);
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == email) {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

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
                        child: Form(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Cadastro",
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
                                  children: <Widget>[
                                    const Text(
                                      "Nome",
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
                                      //     validateEmail(emailController.text);
                                      //   }),
                                      controller: _nameController,
                                      hintText: "Maria da Silva",
                                      obscureText: false,
                                      prefixIcon: const Icon(Icons.person_outline),
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
                                      height: 26,
                                    ),
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
                                      controller: _emailController,
                                      hintText: "example@email.com",
                                      obscureText: false,
                                      prefixIcon: Icon(Icons.mail_outline),
                                    ),
                                    const SizedBox(
                                      height: 26,
                                    ),
                                    const Text(
                                      "Senha",
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
                                      controller: _passwordController,
                                      hintText: "**************",
                                      obscureText: true,
                                      prefixIcon: Icon(Icons.lock_outline),
                                    ),
                                    // const SizedBox(
                                    //   height: 26,
                                    // ),
                                    // const Text(
                                    //   "Data de Aniversário",
                                    //   style: TextStyle(
                                    //     fontFamily: 'Fredoka',
                                    //     fontSize: 18,
                                    //     color: Color(0xff8d8d8d),
                                    //   ),
                                    // ),
                                    // const SizedBox(
                                    //   height: 10,
                                    // ),
                                    // MyTextField(
                                    //   controller: _dataController,
                                    //   hintText: "01/01/2000",
                                    //   obscureText: false,
                                    //   prefixIcon: const Icon(Icons.calendar_month),
                                    // ),
                                    const SizedBox(
                                      height: 26,
                                    ),
                                    Center(
                                      child: Hero(
                                        tag: 'register_btn',
                                        child: CusttomButton(
                                          buttonText: 'CADASTRAR',
                                          onPressed: () {
                                            _register();
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
                                    // const SizedBox(
                                    //   height: 12,
                                    // ),
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
                    ),
                    Transform.translate(
                      offset: const Offset(0, -220),
                      child: Image.asset(
                        'assets/images/background-register.png',
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
