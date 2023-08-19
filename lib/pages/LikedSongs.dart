import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_player/components/MyAppBar.dart';
import 'package:music_player/consets/counsts.dart';
import 'package:music_player/pages/PlayinSong.dart';
import 'package:music_player/components/Songs.dart';
import 'package:music_player/moudles/Player.dart';
import 'package:music_player/moudles/Song.dart';

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
          Container(
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
          ),
          Expanded(
            child: GridView.builder(
                itemCount: Player.songs.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                ),
                itemBuilder: (context, index) {
                  Song s = Player.songs[index];
                  final p = AudioPlayer();
                  return Container(
                      height: _screenHeight * 0.65,
                      child: Songs(
                        song: s,
                        width: 50,
                        onTab: () {},
                      ));
                }),
          ),
        ],
      ),
    );
  }
}
