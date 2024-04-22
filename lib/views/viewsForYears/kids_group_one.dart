import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../services/authentication.dart';

class KidsGroupOneScreen extends StatefulWidget {
  const KidsGroupOneScreen({super.key});

  static String id = 'kids_one_view';

  @override
  State<StatefulWidget> createState() => _KidsGroupOneScreen();
}

class _KidsGroupOneScreen extends State<KidsGroupOneScreen> {
  String? userImageUrl;
  String? userNickname;

  @override
  void initState() {
    super.initState();
    _loadNickname();
    _loadAvatar();
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

                                ],
                              )
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
