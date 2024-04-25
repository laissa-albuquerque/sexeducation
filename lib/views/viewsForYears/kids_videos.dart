import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:sexeducation/components/video_play_view.dart';

import '../../services/authentication.dart';

class KidsVideoScreen extends StatefulWidget {
  const KidsVideoScreen({super.key});

  static String id = 'kids_videos_view';

  @override
  State<StatefulWidget> createState() => _KidsVideoScreen();
}

class _KidsVideoScreen extends State<KidsVideoScreen> {
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
                ]), // Borda arredondada
          ),
        ),
        Image.asset('assets/images/stars-two.png', fit: BoxFit.fitHeight),
        Center(
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              Column(
                children: [
                  Container(
                    
                  )
                ],
              ),
              VideoPlayerView(
                  url: 'assets/videos/desbravando-nosso-corpo-H1.mp4',
                  nameVideo: 'Desbravando nosso corpo'),
            ],
          ),
        ),
      ],
    );
  }
}
