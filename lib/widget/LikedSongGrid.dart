import 'package:flutter/material.dart';
import 'package:music_player/moudles/Player.dart';
import 'package:music_player/moudles/Song.dart';
import 'package:music_player/widget/Songs.dart';

class LikedSongGrid extends StatelessWidget {
  const LikedSongGrid({
    super.key,
    required double screenHeight,
  }) : _screenHeight = screenHeight;

  final double _screenHeight;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
          itemCount: Player.songs.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
          ),
          itemBuilder: (context, index) {
            Song s = Player.loadedsong[index];
            return SizedBox(
                height: _screenHeight * 0.65,
                child: Songs(
                  id: 7,
                  song: s,
                  width: 50,
                  onTab: () {},
                ));
          }),
    );
  }
}
