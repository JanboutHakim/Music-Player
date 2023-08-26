import 'package:flutter/material.dart';
import 'package:music_player/widget/LikedSongGrid.dart';
import 'package:music_player/widget/LikedSongTitle.dart';
import 'package:music_player/widget/MyAppBar.dart';
import 'package:music_player/consets/counsts.dart';

class LikedSongs extends StatefulWidget {
  const LikedSongs({super.key});

  @override
  State<LikedSongs> createState() => _LikedSongsState();
}

class _LikedSongsState extends State<LikedSongs> {
  @override
  Widget build(BuildContext context) {
    final double _screenWidth = MediaQuery.of(context).size.width;
    final double _screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: darkmodebackground,
      body: Column(
        children: [
          MyAppBar(
            firsticon: Icons.arrow_back,
            secondicon: Icons.settings_rounded,
            onPressed: () {
              Navigator.pop(context);
            },
            size: 40,
            onPressed2: () {},
          ),
          LikedSongTitle(
              screenHeight: _screenHeight, screenWidth: _screenWidth),
          LikedSongGrid(screenHeight: _screenHeight),
        ],
      ),
    );
  }
}
