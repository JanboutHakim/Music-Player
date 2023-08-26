import 'package:flutter/material.dart';
import 'package:music_player/consets/counsts.dart';

class SubTitle extends StatelessWidget {
  const SubTitle(
      {super.key,
      required double screenHeight,
      required double screenWidth,
      required this.text})
      : _screenHeight = screenHeight,
        _screenWidth = screenWidth;
  final String text;
  final double _screenHeight;
  final double _screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _screenHeight * 8 / 100,
      padding: const EdgeInsets.all(0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(_screenWidth * 0.05, 0, 0, 0),
            child: Text(text, style: setStyle(normalmodebackground, 24, true)),
          ),
        ],
      ),
    );
  }
}
