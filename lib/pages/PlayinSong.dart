import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:music_player/components/Songs.dart';
import 'package:music_player/consets/counsts.dart';
import 'package:music_player/moudles/Player.dart';
import 'package:music_player/moudles/Song.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class PlayinSong extends StatefulWidget {
  PlayinSong({Key? keyr,required this.sng});
  bool _focusedIndex = false;
    IconData voice=LineIcons.volumeDown;
    double _slider=0;
  Duration _currenttime=Duration(minutes: 0,seconds: 0);
  ItemScrollController _scrollController = ItemScrollController();
    final int sng;
  @override
  State<PlayinSong> createState() => _PlayinSongState();
}

class _PlayinSongState extends State<PlayinSong> {
  int _focusedIndex = -1;

  @override
  void initState() {
    // TODO: implement initState

  }
  @override
  Widget build(BuildContext context) {
    final double _screenWidth = MediaQuery.of(context).size.width;
    final double _screenHeight = MediaQuery.of(context).size.height;
    Duration _duration=Duration(minutes: 1,seconds: 0,hours: 0);

    return Scaffold(

      backgroundColor: darkmodebackground,
      body: Column(
        children: [
          Container(
            height: _screenHeight * 20 / 100,
            child: Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back, color: Colors.white, size: 36),
                ),
                SizedBox(width: _screenWidth*0.1,),
                Text('Playing Now', style: setStyle(normalmodebackground, 30, true)),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, _screenHeight * 1 / 100, 0, _screenHeight * 1 / 100),
            child: Container(
              height: _screenHeight * 42 / 100,
              child: Center(
                child:  Songs(onTab: (){},
                      song: Player.songs[widget.sng],
                    width: 80,

                    )


              ),
            ),
          ),
          Container(padding: EdgeInsets.symmetric(horizontal: _screenWidth*10/100),
            child:Column(
              children: [Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:
                  [ IconButton(iconSize: 32,onPressed: (){ setState(() {
                    widget.voice=LineIcons.volumeUp;

                  });}, icon: Icon(
                    widget.voice,color: Color.fromRGBO(137, 150, 184, 1),size: 32,)),
                    Row(
                      children: [

                        IconButton(iconSize: 32,onPressed: (){}, icon:const Icon(
                          Icons.repeat,color: Color.fromRGBO(137, 150, 184, 1),size: 32,)),
                        IconButton(iconSize: 32,onPressed: (){}, icon:const Icon(
                          LineIcons.random,color: Color.fromRGBO(137, 150, 184, 1),size: 32,))
                      ],
                    ),

                  ]
              ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(format(widget._currenttime),style: setStyle(Color.fromRGBO(137, 150, 184, 1), 12, false),),
                    Text('${format(_duration)} ',style: setStyle(Color.fromRGBO(137, 150, 184, 1), 12, false),),

                  ],
                  
                )
                ,

           ] )
          ),



          Slider(min: 0,max: _duration.inSeconds.toDouble(),
            value:widget._currenttime.inSeconds.toDouble(), onChanged: (value){
            setState(() {
              widget._currenttime=Duration(seconds: value.toInt());
            });
          }
          ,
          activeColor: Colors.white,),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(iconSize: 60,onPressed: () {}, icon: Icon(Icons.skip_previous,color: Colors.white, size: 60,)),
              IconButton(iconSize: 60,onPressed: () {setState(() {});}, icon: Icon(Icons.play_arrow,color: Colors.white, size: 60,)),
              IconButton(iconSize: 60,onPressed: () {}, icon: Icon(Icons.skip_next,color: Colors.white, size: 60,)),
            ],
          )
        ],
      ),
    );
  }
}
