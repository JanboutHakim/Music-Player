import 'package:flutter/material.dart';
import 'package:music_player/consets/counsts.dart';
import 'package:music_player/moudles/Song.dart';

class BottomNavbar extends StatefulWidget {
  final Song song;
  BottomNavbar({super.key, required this.song});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  double _slider = 0.0;

  @override
  Widget build(BuildContext context) {
    return Column(
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
          margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //    padding: EdgeInsets.symmetric(horizontal: _screenWidth*0.5),
              Image.asset(widget.song.imagepath,
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width * 20 / 100),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  widget.song.title,
                  style: setStyle(normalmodebackground, 20, false),
                ),
                Text(
                  widget.song.subtitle,
                  style: setStyle(normalmodebackground, 10, false),
                )
              ]),
              SizedBox(width: MediaQuery.of(context).size.width * 4 / 100),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.skip_previous,
                    color: Colors.white,
                    size: 36,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                    size: 36,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.skip_next,
                    color: Colors.white,
                    size: 36,
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
