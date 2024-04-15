import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AgeOptionsMenuScreen extends StatefulWidget {
  const AgeOptionsMenuScreen({super.key});

  static String id = 'ageoptions_view';

  @override
  State<AgeOptionsMenuScreen> createState() => _AgeOptionsMenuScreen();
}

class _AgeOptionsMenuScreen extends State<AgeOptionsMenuScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('teste'),
    );
  }

}