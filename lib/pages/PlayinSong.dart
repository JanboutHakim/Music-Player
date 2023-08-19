import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:music_player/components/Songs.dart';
import 'package:music_player/consets/counsts.dart';
import 'package:music_player/moudles/Player.dart';
import 'package:music_player/components/PlayingControl.dart';

class PlayinSong extends StatefulWidget {
  PlayinSong(
      {Key? keyr,
      required this.sng,
      required this.playerpath,
      required this.player});
  final String playerpath;
  final AudioPlayer player;
  int sng;

  @override
  State<PlayinSong> createState() => _PlayinSongState();
}

class _PlayinSongState extends State<PlayinSong> {
  Duration _currenttime = Duration.zero;
  int index = 0;
  IconData voice = LineIcons.volumeDown;

  Duration _duration = Duration.zero;
  late AudioPlayer player;
  @override
  void initState() {
    player = widget.player;
    player.onPlayerStateChanged.listen((PlayerState s) {
      if (s == PlayerState.playing) {
        player.dispose();
      }
    });
    player.play(AssetSource(widget.playerpath));
    index = widget.sng;
    super.initState();
    player.onDurationChanged.listen((newDuration) {
      setState(() {
        _duration = newDuration;
      });
    });
    player.onPositionChanged.listen((newPosition) {
      setState(() {
        _currenttime = newPosition;
      });
    });
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
            height: _screenHeight * 20 / 100,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    player.stop();
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back,
                      color: Colors.white, size: 36),
                ),
                SizedBox(
                  width: _screenWidth * 0.1,
                ),
                Text('Playing Now',
                    style: setStyle(normalmodebackground, 30, true)),
              ],
            ),
          ),
          GestureDetector(
            onHorizontalDragEnd: (derction) {
              print(index);
              if (derction.primaryVelocity! > 0) {
                if (index == 0) {
                  setState(() {
                    index = Player.songs.length - 2;
                  });
                } else {
                  setState(() {
                    index -= 1;
                  });
                }
              }

              if (derction.primaryVelocity! < 0) {
                if (index == Player.songs.length - 1) {
                  setState(() {
                    index = 0;
                  });
                } else {
                  index += 1;
                }
              }
            },
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  0, _screenHeight * 1 / 100, 0, _screenHeight * 1 / 100),
              child: Container(
                height: _screenHeight * 42 / 100,
                child: Center(
                    child: Songs(
                  onTab: () {},
                  song: Player.songs[index],
                  width: 80,
                )),
              ),
            ),
          ),
          Container(
              padding:
                  EdgeInsets.symmetric(horizontal: _screenWidth * 10 / 100),
              child: Column(children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          iconSize: 32,
                          onPressed: () {
                            setState(() {
                              voice = LineIcons.volumeUp;
                            });
                          },
                          icon: Icon(
                            voice,
                            color: Color.fromRGBO(137, 150, 184, 1),
                            size: 32,
                          )),
                      Row(
                        children: [
                          IconButton(
                              iconSize: 32,
                              onPressed: () {},
                              icon: const Icon(
                                Icons.repeat,
                                color: Color.fromRGBO(137, 150, 184, 1),
                                size: 32,
                              )),
                          IconButton(
                              iconSize: 32,
                              onPressed: () {},
                              icon: const Icon(
                                LineIcons.random,
                                color: Color.fromRGBO(137, 150, 184, 1),
                                size: 32,
                              ))
                        ],
                      ),
                    ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      format(_currenttime),
                      style: setStyle(
                          const Color.fromRGBO(137, 150, 184, 1), 12, false),
                    ),
                    Text(
                      '${format(_duration)} ',
                      style: setStyle(
                          const Color.fromRGBO(137, 150, 184, 1), 12, false),
                    ),
                  ],
                ),
              ])),
          Slider(
            min: 0,
            max: _duration.inSeconds.toDouble(),
            value: _currenttime.inSeconds.toDouble(),
            onChanged: (value) {
              final position = Duration(seconds: value.toInt());
              player.seek(position);
              player.resume();
            },
            activeColor: Colors.white,
          ),
          PlayingControl(
            player: player,
          )
        ],
      ),
    );
  }
}
