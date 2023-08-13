import 'package:flutter/material.dart';
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
           MyAppBar(onPressed: (){},),
          ],
        
      ),
    drawer: Drawer(
      backgroundColor: Colors.red,
    )
    );



  }
}
