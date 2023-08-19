import 'package:flutter/material.dart';
import 'package:music_player/consets/counsts.dart';

class DrawerItem extends StatefulWidget {
  final void Function() onPressed;

  final IconData iconshape;
  final String text;
  DrawerItem({
    super.key,
    required this.iconshape,
    required this.text,
    required this.onPressed,
  });

  @override
  State<DrawerItem> createState() => _DrawerItemState();
}

class _DrawerItemState extends State<DrawerItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(getPaddingprictinge(5, context),
          getPaddingprictinge(2, context), getPaddingprictinge(5, context), 0),
      child: Row(
        children: [
          Icon(
            widget.iconshape,
            color: Colors.white,
            size: 36,
          ),
          SizedBox(
            width: getPaddingprictinge(5, context),
          ),
          TextButton(
            onPressed: widget.onPressed,
            child: Text(widget.text,
                style: setStyle(normalmodebackground, 20, false)),
          )
        ],
      ),
    );
  }
}
