import 'dart:async';
import 'package:flutter/material.dart';
import 'package:high_final_project/ImagePage.dart';
import 'package:video_player/video_player.dart';



class VideoPlayerScreen extends StatefulWidget {
  //VideoPlayerScreen({Key key}) : super(key: key);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController? _controller;
  Future<void>? _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('image/pokeVideo.mov')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }



  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        title: Text('Poke Video',
          style: TextStyle(
              fontWeight: FontWeight.bold
          ),),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.navigate_before_outlined),
            tooltip: 'Next page',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context)=> ImagePage()));
            },
          ),
        ],

      ),
        body: Center(
          child: _controller!.value.isInitialized
              ? AspectRatio(
            aspectRatio: _controller!.value.aspectRatio,
            child: VideoPlayer(_controller!),
          )
              : Container(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _controller!.value.isPlaying
                  ? _controller!.pause()
                  : _controller!.play();
            });
          },
          child: Icon(
            _controller!.value.isPlaying ? Icons.pause : Icons.play_arrow,
            color: Colors.blue[200],
          ),
        ),
      );

  }

  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
  }


}