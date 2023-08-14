import 'package:flutter/material.dart';
import 'package:music_player/consets/counsts.dart';
import 'package:music_player/moudles/Song.dart';
class Songs extends StatefulWidget {
   Songs({super.key,
  required this.song});
 Song song;

  @override
  State<Songs> createState() => _SongsState();
}

class _SongsState extends State<Songs> {
  @override
  Widget build(BuildContext context) {
    return
          Container(width: MediaQuery.of(context).size.width*65/100,
            child: ListTile(
            title:  Image.asset(widget.song.imagepath,fit: BoxFit.cover
              ,height: MediaQuery.of(context).size.width*50/100,width: 200,),
              subtitle : Column(
                children: [             Text(widget.song.title,style: setStyle(normalmodebackground, 16, true),),
                  Text(widget.song.subtitle,style: setStyle(const Color.fromRGBO(165, 192, 255, 1), 10, false),),


                ],
              )



            ),


    );
  }
}
