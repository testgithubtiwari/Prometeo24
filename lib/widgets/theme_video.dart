import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ThemeVideo extends StatefulWidget {
  final String videoUrl;

  const ThemeVideo({Key? key, required this.videoUrl}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<ThemeVideo> createState() => _ThemeVideoState(videoUrl);
}

class _ThemeVideoState extends State<ThemeVideo> {
  late YoutubePlayerController _controller;

  _ThemeVideoState(String videoUrl) {
    final videoId = YoutubePlayer.convertUrlToId(videoUrl);
    _controller = YoutubePlayerController(
      initialVideoId: videoId!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(size.width * 0.01),
      child: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: false,
      ),
    );
  }
}
