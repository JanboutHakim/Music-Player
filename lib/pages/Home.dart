import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:music_player/components/DrawerAppBar.dart';
import 'package:music_player/components/DrawerItem.dart';
import 'package:music_player/components/MyAppBar.dart';
import 'package:music_player/consets/counsts.dart';
import 'package:music_player/moudles/Song.dart';
import 'package:music_player/moudles/Player.dart';
import 'package:music_player/components/Songs.dart';
import 'package:music_player/components/BottomNavbar.dart';
import 'package:music_player/pages/PlayinSong.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Indicate if application has permission to the library.
  int indexHome = -1;
  late AudioPlayer player;
  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
  }

  @override
  Widget build(BuildContext context) {
    final double _screenWidth = MediaQuery.of(context).size.width;
    final double _screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: darkmodebackground,
      body: Column(
        children: [
          Container(
            height: _screenHeight * 10 / 100,
            child: MyAppBar(
              onPressed: () {},
              firsticon: LineIcons.equals,
              secondicon: LineIcons.search,
              size: 46.0,
            ),
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
                    child: Text('Recommended For You',
                        style: setStyle(normalmodebackground, 24, true)),
                  ),
                ],
              ),
            ),
          ),
          Container(
            //   padding: EdgeInsets.fromLTRB(_screenWidth * 0.1, 0, 0, 0),
            height: _screenHeight * 29.5 / 100,
            child: ListView.builder(
              itemCount: Player.songs.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                Song s = Player.songs[index];
                return Songs(
                  song: s,
                  width: 60,
                  onTab: () {},
                );
              },
            ),
          ),
          Container(
            height: _screenHeight * 8 / 100,
            padding: const EdgeInsets.all(0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(_screenWidth * 0.05, 0, 0, 0),
                  child: Text('Your Play List',
                      style: setStyle(normalmodebackground, 24, true)),
                ),
              ],
            ),
          ),
          Container(
            //  padding: EdgeInsets.fromLTRB(_screenWidth * 0.1, 0, 0, 0),
            height: _screenHeight * 29.5 / 100,
            child: ListView.builder(
              itemCount: Player.songs.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                Song s = Player.songs[index];
                return Songs(
                  song: s,
                  width: 60,
                  onTab: () {
                    indexHome = index;
                    setState(() {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return PlayinSong(
                          playerpath: 'julia1.mp3',
                          player: player,
                          sng: index,
                        );
                      }));
                    });
                  },
                );
              },
            ),
          ),
          indexHome == -1
              ? SizedBox(
                  height: _screenHeight * 15 / 100,
                )
              : SizedBox(
                  height: _screenHeight * 15 / 100,
                  child: BottomNavbar(
                    song: Player.songs[indexHome],
                  ))
        ],
      ),
      drawer: Drawer(
        backgroundColor: darkmodebackground,
        child: Column(
          children: [
            DrawerAppBar(
              onPressed: () {},
              firsticon: Icons.close,
              secondicon: Icons.dark_mode,
              size: 40.0,
            ),
            Expanded(
              child: ListView(
                children: [
                  DrawerItem(
                      iconshape: Icons.person,
                      text: 'Profile',
                      onPressed: () => Navigator.pop(context)),
                  DrawerItem(
                      iconshape: LineIcons.heart,
                      text: 'Liked Songs',
                      onPressed: () {
                        Navigator.pushNamed(context, '/likedsongs');
                      }),
                  DrawerItem(
                      iconshape: Icons.message,
                      text: 'Contact Us',
                      onPressed: () {}),
                  DrawerItem(
                      iconshape: Icons.language,
                      text: 'Language',
                      onPressed: () {}),
                  DrawerItem(
                      iconshape: LineIcons.lightbulb,
                      text: 'FAQs',
                      onPressed: () {}),
                  DrawerItem(
                      iconshape: Icons.settings,
                      text: 'Setting',
                      onPressed: () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void setIndex(int index) {
    setState(() {
      indexHome = index;
    });
  }
}
