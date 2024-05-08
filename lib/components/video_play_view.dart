import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerView extends StatefulWidget {

  final String url;
  final String nameVideo;

  const VideoPlayerView({
    super.key,
    required this.url,
    required this.nameVideo,
  });

  @override
  State<VideoPlayerView> createState() => _VideoPlayerViewState();
}

class _VideoPlayerViewState extends State<VideoPlayerView> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;
  late String nameVideo = "";

  Future initializeVideo() async {
    _videoPlayerController = VideoPlayerController.asset(widget.url);

    await _videoPlayerController.initialize();

    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: 16 / 9,
      looping: false,
    );

    setState(() {});
  }

  @override
  void initState() {
    initializeVideo();
    super.initState();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_chewieController == null) {
      return Container(
        height: 800,
        alignment: Alignment.center,
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Carregando vídeos...',
                style: TextStyle(
                  fontFamily: 'KleeOne',
                  color: Colors.white,
                  fontSize: 22,
                  decoration: TextDecoration.none,
                ),
              ),
            ],
          ),
        ),
      );
    }
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.transparent, // Cor da borda
          width: 2, // Largura da borda
        ),
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
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
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.nameVideo,
                style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'KleeOne',
                    fontSize: 20,
                    decoration: TextDecoration.none)),
            const Divider(),
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Chewie(controller: _chewieController!),
            ),
          ],
        ),
      ),
    );
  }
}
