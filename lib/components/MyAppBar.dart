import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:music_player/consets/counsts.dart';


class MyAppBar extends StatefulWidget {
  void Function() onPressed;
   MyAppBar({super.key,required this.onPressed});


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
                     iconSize: 50, onPressed:() {Scaffold.of(context).openDrawer();},
                       icon: Icon(LineIcons.equals,color: normalmodebackground,size: 50,));
                }
              )
    ,
               IconButton(onPressed: ()=> widget.onPressed(),iconSize: 50, icon:
                  Icon(LineIcons.search,color: normalmodebackground,size: 50,)),
    ],),
       )
    ;
  }
}
