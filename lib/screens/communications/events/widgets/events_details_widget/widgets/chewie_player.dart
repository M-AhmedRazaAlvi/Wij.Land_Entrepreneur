import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ChewiePlayers extends StatefulWidget {
  final VideoPlayerController videoPlayerController;

  const ChewiePlayers({Key? key, required this.videoPlayerController})
      : super(key: key);

  @override
  State<ChewiePlayers> createState() => _ChewiePlayersState();
}

class _ChewiePlayersState extends State<ChewiePlayers> {
  late ChewieController _chewieController;
  late VideoPlayerController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
      widget.videoPlayerController.initialize();
    _chewieController = ChewieController(
      videoPlayerController: widget.videoPlayerController,
      autoPlay: false,
      autoInitialize: true,
      looping: false,
       aspectRatio:1.4,
       //maxScale: 3.2,
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return //_controller.value.isInitialized? VideoPlayer(_controller):Center(child: CircularProgressIndicator(),);

    Chewie(
      controller: _chewieController,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    widget.videoPlayerController.dispose();
    _controller.dispose();
    _chewieController.dispose();
  }
}
