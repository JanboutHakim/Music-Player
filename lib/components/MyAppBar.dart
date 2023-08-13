

import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:music_player/consets/counsts.dart';


class MyAppBar extends StatefulWidget {
  void Function() onPressed;
  double size;


  IconData  firsticon;
  IconData secondicon;
   MyAppBar({super.key,required this.onPressed,required this.firsticon,required this.secondicon,required this.size,
   });
  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {

  @override
  Widget build(BuildContext context) {

    return
       Padding(padding: EdgeInsets.fromLTRB(getPaddingprictinge(5,context),getPaddingprictinge(8, context),getPaddingprictinge(5, context),getPaddingprictinge(4, context)),
         child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [

              Builder(
                builder: (context) {

                  return IconButton(
                     iconSize: widget.size, onPressed: (){Scaffold.of(context).openDrawer();},
                       icon: Icon(widget.firsticon,color: normalmodebackground,size: widget.size,));
                }
              )
    ,
               IconButton(onPressed: ()=> widget.onPressed(),iconSize: widget.size, icon:
                  Icon(widget.secondicon,color: normalmodebackground,size: widget.size,)),
    ],),
       )
    ;
  }
}
