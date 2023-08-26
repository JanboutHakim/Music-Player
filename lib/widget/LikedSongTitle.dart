import 'package:flutter/material.dart';
import 'package:music_player/consets/counsts.dart';

class LikedSongTitle extends StatelessWidget {
  const LikedSongTitle({
    super.key,
    required double screenHeight,
    required double screenWidth,
  })  : _screenHeight = screenHeight,
        _screenWidth = screenWidth;

  final double _screenHeight;
  final double _screenWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _screenHeight * 8 / 100,
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(_screenWidth * 0.05, 0, 0, 0),
              child: Text('Liked Songs',
                  style: setStyle(normalmodebackground, 24, true)),
            ),
          ],
        ),
      ),
    );
  }
}
