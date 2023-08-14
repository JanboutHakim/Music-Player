import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:music_player/components/DrawerAppBar.dart';
import 'package:music_player/components/DrawerItem.dart';
import 'package:music_player/components/MyAppBar.dart';
import 'package:music_player/consets/counsts.dart';
import 'package:music_player/moudles/Song.dart';
import 'package:music_player/moudles/Player.dart';
import 'package:music_player/components/Songs.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double _slider = 0.0;

  @override
  Widget build(BuildContext context) {
    final double _screenWidth = MediaQuery.of(context).size.width;
    final double _screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: darkmodebackground,
      body: Column(
        children: [
          Container(
            height: _screenHeight * 15 / 100,
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
                  Text('Recommended For You', style: setStyle(normalmodebackground, 24, true)),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(_screenWidth * 0.1, 0, 0, 0),
            height: _screenHeight * 27 / 100,
            child: ListView.builder(
              itemCount: Player.songs.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                Song s = Player.songs[index];
                return Songs(song: s);
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
                  padding: EdgeInsets.fromLTRB(_screenWidth * 0.1, 0, 0, 0),
                  child: Text('Your Play List', style: setStyle(normalmodebackground, 24, true)),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(_screenWidth * 0.1, 0, 0, 0),
            height: _screenHeight * 27 / 100,
            child: ListView.builder(
              itemCount: Player.songs.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                Song s = Player.songs[index];
                return Songs(song: s);
              },
            ),
          ),
          Container(
            height: _screenHeight * 15 / 100,
            child: Column(
              children: [
                Slider(
                  activeColor: normalmodebackground,
                  label: 'Hello',
                  value: _slider,
                  onChanged: (newValue) {
                    setState(() {
                      _slider = newValue;
                    });
                  },
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: _screenWidth*8/100),

                  child: Row(
                    children: [

                      //    padding: EdgeInsets.symmetric(horizontal: _screenWidth*0.5),
                      Image.asset('images/gym.jpg', fit: BoxFit.cover, width: _screenWidth*20/100),
                      Column(
                        children: [
                          Text('data'),
                        ],
                      ),
                      SizedBox(width: 10),
                      IconButton(onPressed: () {}, icon: Icon(Icons.co2)),
                      IconButton(onPressed: () {}, icon: Icon(Icons.co2)),
                      IconButton(onPressed: () {}, icon: Icon(Icons.co2)),
                    ],
                  ),
                ),
              ],
            ),
          ),
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
                  DrawerItem(iconshape: Icons.person, text: 'Profile', onPressed: () => Navigator.pop(context)),
                  DrawerItem(iconshape: LineIcons.heart, text: 'Liked Songs', onPressed: () {}),
                  DrawerItem(iconshape: Icons.message, text: 'Contact Us', onPressed: () {}),
                  DrawerItem(iconshape: Icons.language, text: 'Language', onPressed: () {}),
                  DrawerItem(iconshape: LineIcons.lightbulb, text: 'FAQs', onPressed: () {}),
                  DrawerItem(iconshape: Icons.settings, text: 'Setting', onPressed: () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

