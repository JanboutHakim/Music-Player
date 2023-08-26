import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:music_player/consets/counsts.dart';
import 'package:music_player/moudles/Song.dart';

class Songs extends StatefulWidget {
  Songs(
      {super.key,
      required this.id,
      required this.song,
      required this.width,
      required this.onTab});
  final VoidCallback onTab;
  final int id;

  final double width;
  final Song song;

  @override
  _SongsState createState() => _SongsState();
}

class _SongsState extends State<Songs> {
  late Future<Color?> _mainColorFuture;
  Color _mainColor = Colors.white;

  @override
  void initState() {
    super.initState();
    _mainColorFuture = _getImageColor();
  }

  Future<Color?> _getImageColor() async {
    final paletteGenerator = await PaletteGenerator.fromImageProvider(
      AssetImage('images/apart.jpg'),
      maximumColorCount: 1, // We only want the dominant color
    );

    return paletteGenerator.dominantColor?.color;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Color?>(
      future: _mainColorFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          _mainColor = snapshot.data ?? Colors.black;
        }

        return Container(
          margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 1.5 / 100),
          width: MediaQuery.of(context).size.width * widget.width / 100,
          child: ListTile(
            onTap: () {
              widget.onTab();
            },
            title: Container(
              decoration: BoxDecoration(
                color: darkmodebackground,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: _mainColor,
                    spreadRadius: 0,
                    blurRadius: 30,
                    offset: Offset(0, 12),
                  ),
                ],
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.width *
                        (widget.width - 10) /
                        100,
                    child: QueryArtworkWidget(
                        nullArtworkWidget: Image.asset(
                          'images/apart.jpg',
                          width: MediaQuery.of(context).size.width *
                              (widget.width - 10) /
                              100,
                          fit: BoxFit.fitWidth,
                        ),
                        errorBuilder: (p0, p1, p2) =>
                            Image.asset('images/apart.jpg'),
                        artworkFit: BoxFit.cover,
                        artworkClipBehavior: Clip.none,
                        artworkBorder: BorderRadius.zero,
                        id: widget.id,
                        type: ArtworkType.AUDIO),
                  )),
            ),
            subtitle: Column(
              children: [
                Text(
                  widget.song.title,
                  style: setStyle(normalmodebackground, 16, true),
                ),
                Text(
                  widget.song.subtitle,
                  style: setStyle(
                      const Color.fromRGBO(165, 192, 255, 1), 10, false),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
