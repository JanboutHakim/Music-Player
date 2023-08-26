import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:music_player/consets/counsts.dart';
import 'package:music_player/widget/DrawerAppBar.dart';
import 'package:music_player/widget/DrawerItem.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: darkmodebackground,
      child: Column(
        children: [
          DrawerAppBar(
            onPressed: () {},
            firsticon: Icons.close,
            secondicon: Icons.dark_mode,
            size: 40.0,
          ),
          Expanded(
            child: ListView(
              children: [
                DrawerItem(
                    iconshape: Icons.person,
                    text: 'Profile',
                    onPressed: () => Navigator.pop(context)),
                DrawerItem(
                    iconshape: LineIcons.heart,
                    text: 'Liked Songs',
                    onPressed: () {
                      Navigator.pushNamed(context, '/likedsongs');
                    }),
                DrawerItem(
                    iconshape: Icons.message,
                    text: 'Contact Us',
                    onPressed: () {}),
                DrawerItem(
                    iconshape: Icons.language,
                    text: 'Language',
                    onPressed: () {}),
                DrawerItem(
                    iconshape: LineIcons.lightbulb,
                    text: 'FAQs',
                    onPressed: () {}),
                DrawerItem(
                    iconshape: Icons.settings,
                    text: 'Setting',
                    onPressed: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
