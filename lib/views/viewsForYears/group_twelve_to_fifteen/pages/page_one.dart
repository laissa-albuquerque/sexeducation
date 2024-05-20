import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sexeducation/views/viewsForYears/group_twelve_to_fifteen/diary.dart';

class PageOneScreen extends StatefulWidget {
  const PageOneScreen({Key? key}) : super(key: key);

  static String id = 'page_one_view';

  @override
  State<StatefulWidget> createState() => _PageOneScreenState();
}

class _PageOneScreenState extends State<PageOneScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  void resetOrientation() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        resetOrientation();
        return true;
      },
      child: Scaffold(
        body: Stack(
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
                  ],
                ),
              ),
            ),
            PageView(
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              children: List.generate(13, (index) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  child: SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: Image.asset(
                      'assets/images-diary/page${index + 1}.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }),
            ),
            Positioned(
              bottom: 32,
              left: 20,
              child: Visibility(
                visible: _currentPage == 0 || _currentPage == 12,
                child: FloatingActionButton(
                  onPressed: () {
                    if (_currentPage != 0 && _currentPage != 12) {
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      resetOrientation(); // Reset orientation before navigating
                      Navigator.pushNamed(context, DiaryScreen.id);
                    }
                  },
                  backgroundColor: const Color(0xffBFCAFF),
                  shape: const CircleBorder(),
                  child: const Icon(Icons.keyboard_arrow_left, color: Color(0xff37035F), size: 32),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    resetOrientation(); // Reset orientation when disposing the screen
    _pageController.dispose(); // Dispose the PageController
    super.dispose();
  }
}
