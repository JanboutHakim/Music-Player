import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:music_player/components/DrawerAppBar.dart';
import 'package:music_player/components/DrawerItem.dart';
import 'package:music_player/components/MyAppBar.dart';
import 'package:music_player/consets/counsts.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: darkmodebackground,

      body:
         Column(
      children: [
           MyAppBar(onPressed: (){},firsticon: LineIcons.equals,secondicon: LineIcons.search,size: 46.0,),
          ],
        
      ),
    drawer: Drawer(backgroundColor: darkmodebackground ,
      child: Column(
        children: [
          DrawerAppBar(onPressed: (){},firsticon:Icons.close,secondicon:Icons.dark_mode,size:40.0,

           ),
          Expanded(
            child: ListView(children: [
              DrawerItem(iconshape: Icons.person, text: 'Profile',onPressed: (){Navigator.pop(context);},),
              DrawerItem(iconshape: LineIcons.heart, text: 'Liked Songs',onPressed: (){},),

              DrawerItem(iconshape: Icons.message, text: 'Contact Us',onPressed: (){},),

              DrawerItem(iconshape: Icons.language, text: 'Language',onPressed: (){},),

              DrawerItem(iconshape: LineIcons.lightbulb, text: 'FAQs',onPressed: (){},),
              DrawerItem(iconshape: Icons.settings, text: 'Setting',onPressed: (){},),]
            ),
          )
         


        ],
      ),
    )
    );



  }
}
