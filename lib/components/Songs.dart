import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:music_player/consets/counsts.dart';
import 'package:music_player/moudles/Song.dart';

class Songs extends StatefulWidget {
  Songs(
      {super.key,
      required this.song,
      required this.width,
      required this.onTab});
  final VoidCallback onTab;

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
      AssetImage(widget.song.imagepath),
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
                child: Image.asset(
                  widget.song.imagepath,
                  fit: BoxFit.fitWidth,
                  height: MediaQuery.of(context).size.width *
                      (widget.width - 10) /
                      100,
                  width: 200,
                ),
              ),
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
