import 'package:flutter/material.dart';
import 'package:music_player/consets/counsts.dart';
class DrawerAppBar extends StatefulWidget {
  IconData  firsticon;
  IconData secondicon;
  double size;
  void Function() onPressed;
  DrawerAppBar({super.key,required this.onPressed,required this.firsticon,required this.secondicon,required this.size,
  });

  @override
  State<DrawerAppBar> createState() => _DrawerAppBarState();
}

class _DrawerAppBarState extends State<DrawerAppBar> {
  @override
  Widget build(BuildContext context) {
    return

      Padding(padding: EdgeInsets.fromLTRB(getPaddingprictinge(5,context),getPaddingprictinge(8, context),getPaddingprictinge(5, context),getPaddingprictinge(4, context)),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Builder(
                builder: (context) {

                  return IconButton(
                      iconSize: widget.size, onPressed: (){Navigator.pop(context);},
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
