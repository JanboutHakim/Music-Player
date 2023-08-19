import 'package:flutter/material.dart';
import 'package:music_player/pages/Home.dart';
import 'package:music_player/pages/LikedSongs.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      '/': (context) => Home(),
      '/likedsongs': (context) => LikedSongs()
    },
  ));
}
