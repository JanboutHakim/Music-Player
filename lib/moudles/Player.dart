import 'package:flutter/material.dart';
import 'package:music_player/moudles/Song.dart';
import 'package:on_audio_query/on_audio_query.dart';

class Player extends ChangeNotifier {
  final OnAudioQuery _audioQuery = OnAudioQuery();

  static List<SongModel> songs = [];
  void getSong() async {
    songs = await _audioQuery.querySongs();
    notifyListeners();
  }

  static List<Song> loadedsong = [];
  static List<Song> addsongs() {
    for (SongModel song in songs) {
      loadedsong.add(Song(
          songpath: '/storage/emulated/0/${song.data}',
          subtitle: song.artist!,
          title: song.title));
    }

    return loadedsong;
  }
}
