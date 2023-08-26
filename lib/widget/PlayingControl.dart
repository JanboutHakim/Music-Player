import 'package:flutter/material.dart';
import 'package:music_player/pages/Home.dart';

class PlayingControl extends StatefulWidget {
  PlayingControl({
    super.key,
  });

  @override
  State<PlayingControl> createState() => _PlayingControlState();
}

class _PlayingControlState extends State<PlayingControl> {
  bool isPlaying = true;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            iconSize: 60,
            onPressed: () {
              player.previousIndex;
            },
            icon: const Icon(
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
            onPressed: () {
              player.nextIndex;
            },
            icon: const Icon(
              Icons.skip_next,
              color: Colors.white,
              size: 60,
            )),
      ],
    );
  }

  void playSong() async {
    player.play();
  }

  void stopSong() async {
    player.pause();
  }
}
