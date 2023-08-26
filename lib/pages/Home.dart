import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:line_icons/line_icons.dart';
import 'package:music_player/widget/BottomNavbar.dart';
import 'package:music_player/widget/CustomDrawer.dart';
import 'package:music_player/widget/CustomListView.dart';
import 'package:music_player/widget/MyAppBar.dart';
import 'package:music_player/consets/counsts.dart';
import 'package:music_player/moudles/Song.dart';
import 'package:music_player/widget/SubTitle.dart';

late AudioPlayer player;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Song> songs = [];

  int indexHome = -1;
  @override
  void initState() {
    player = AudioPlayer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double _screenWidth = MediaQuery.of(context).size.width;
    final double _screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: darkmodebackground,
      body: Column(
        children: [
          SizedBox(
            height: _screenHeight * 10 / 100,
            child: MyAppBar(
              onPressed: () {},
              firsticon: LineIcons.equals,
              secondicon: LineIcons.search,
              size: 46.0,
            ),
          ),
          SubTitle(
              screenHeight: _screenHeight,
              screenWidth: _screenWidth,
              text: 'Recomanded For You'),
          CustomListView(screenHeight: _screenHeight),
          SubTitle(
            screenHeight: _screenHeight,
            screenWidth: _screenWidth,
            text: 'Your Playlist',
          ),
          CustomListView(
            screenHeight: _screenHeight,
          ),
          indexHome == -1
              ? SizedBox(
                  height: _screenHeight * 15 / 100,
                )
              : SizedBox(
                  height: _screenHeight * 15 / 100,
                  child: BottomNavbar(
                    song: songs[indexHome],
                  ))
        ],
      ),
      drawer: const CustomDrawer(),
    );
  }

  void setIndex(int index) {
    setState(() {
      indexHome = index;
    });
  }
}
