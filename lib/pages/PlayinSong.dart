import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:line_icons/line_icons.dart';
import 'package:music_player/widget/Songs.dart';
import 'package:music_player/consets/counsts.dart';
import 'package:music_player/moudles/Player.dart';
import 'package:music_player/widget/PlayingControl.dart';
import 'package:permission_handler/permission_handler.dart';

class PlayinSong extends StatefulWidget {
  PlayinSong({Key? keyr, required this.sng, required this.player});
  final Songs sng;
  final AudioPlayer player;

  @override
  State<PlayinSong> createState() => _PlayinSongState();
}

class _PlayinSongState extends State<PlayinSong> {
  Duration _currenttime = Duration.zero;
  int index = 0;
  IconData voice = LineIcons.volumeDown;

  Duration _duration = Duration.zero;
  @override
  void initState() {
    durationupdate();
    print('Hello $_duration');
    checkPermissionStatus();
    index = 5;
    super.initState();
  }

  void durationupdate() {
    print('object');
    setState(() {
      widget.player.durationStream.listen((event) {
        _duration = event ?? Duration(microseconds: 20);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print('hi');
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
                  height: _screenHeight * 42 / 100, child: widget.sng),
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
              widget.player.seek(position);
            },
            activeColor: Colors.white,
          ),
          PlayingControl()
        ],
      ),
    );
  }

  Future<void> checkPermissionStatus() async {
    final status = await Permission.storage.status;
    if (status.isGranted) {
      // Permission is already granted.
    } else {
      // Permission is not granted; you might want to request it.
      await requestStoragePermission();
    }
  }

  Future<void> requestStoragePermission() async {
    final status = await Permission.storage.request();
    if (status.isGranted) {
      // Permission granted, you can now access the storage.
    } else {
      // Permission denied. Handle the case where the user didn't grant permission.
    }
  }
}
