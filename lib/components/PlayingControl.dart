import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class PlayingControl extends StatefulWidget {
  AudioPlayer player;
  PlayingControl({
    required this.player,
    super.key,
  });

  @override
  State<PlayingControl> createState() => _PlayingControlState();
}

class _PlayingControlState extends State<PlayingControl> {
  late AudioPlayer playerk;
  bool isPlaying = true;
  @override
  void initState() {
    playerk = widget.player;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            iconSize: 60,
            onPressed: () {},
            icon: Icon(
              Icons.skip_previous,
              color: Colors.white,
              size: 60,
            )),
        IconButton(
            iconSize: 60,
            onPressed: () {
              setState(() {
                if (isPlaying) {
                  stopSong();

                  isPlaying = false;
                } else {
                  playSong();

                  isPlaying = true;
                }
              });
            },
            icon: Icon(
              isPlaying ? Icons.stop : Icons.play_arrow,
              color: Colors.white,
              size: 60,
            )),
        IconButton(
            iconSize: 60,
            onPressed: () {},
            icon: Icon(
              Icons.skip_next,
              color: Colors.white,
              size: 60,
            )),
      ],
    );
  }

  void playSong() async {
    await playerk.resume();
  }

  void stopSong() async {
    await playerk.pause();
  }
}
