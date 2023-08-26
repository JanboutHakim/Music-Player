import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_player/consets/counsts.dart';
import 'package:music_player/moudles/Song.dart';
import 'package:music_player/pages/Home.dart';
import 'package:music_player/pages/PlayinSong.dart';
import 'package:music_player/widget/Songs.dart';
import 'package:on_audio_query/on_audio_query.dart';

class CustomListView extends StatefulWidget {
  const CustomListView({super.key, required this.screenHeight});
  final double screenHeight;

  @override
  State<CustomListView> createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView> {
  final OnAudioQuery _audioQuery = OnAudioQuery();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        //  padding: EdgeInsets.fromLTRB(_screenWidth * 0.1, 0, 0, 0),
        height: widget.screenHeight * 29.5 / 100,
        child: FutureBuilder<List<SongModel>>(
            future: getSongs(),
            builder: (BuildContext context, snapshot) {
              if (snapshot.data == null) {
                return const Text('Sorry');
              } else if (snapshot.data!.isEmpty) {
                return Center(
                  child: Text(
                    'NO Song Found ',
                    style: setStyle(Colors.white, 36, true),
                  ),
                );
              } else {
                return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height: widget.screenHeight * 29.5 / 100,
                        child: Songs(
                            id: snapshot.data![index].id,
                            song: Song(
                              songpath: "",
                              subtitle: snapshot.data![index].artist!,
                              title: snapshot.data![index].displayNameWOExt,
                            ),
                            width: 60,
                            onTab: () {
                              playSong(snapshot.data![index].uri!);
                              Navigator.push(context,
                                  MaterialPageRoute(builder: ((context) {
                                return PlayinSong(
                                  player: player,
                                  sng: Songs(
                                      id: snapshot.data![index].id,
                                      song: Song(
                                        songpath: "",
                                        subtitle: snapshot.data![index].artist!,
                                        title: snapshot
                                            .data![index].displayNameWOExt,
                                      ),
                                      width: 60,
                                      onTab: () {}),
                                );
                              })));
                            }),
                      );
                    });
              }
            }));
  }

  Future<List<SongModel>> getSongs() async {
    List<SongModel> songss = await _audioQuery.querySongs(
        ignoreCase: true,
        orderType: OrderType.ASC_OR_SMALLER,
        sortType: SongSortType.TITLE,
        uriType: UriType.EXTERNAL);
    return songss;
  }

  void playSong(String uri) async {
    try {
      await player.setAudioSource(AudioSource.uri(Uri.parse(uri)));
      player.play();
    } catch (e) {
      print(e);
    }
  }
}
