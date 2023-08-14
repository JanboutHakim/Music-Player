
import 'package:palette_generator/palette_generator.dart';
import 'package:flutter/material.dart';
class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();

}

class _TestState extends State<Test> {
  Color? maincolor;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      SafeArea(
        child: Container
          (height: 200,
          width: 200,
          color: maincolor,
          child: Text('HELLO'),
        ),
      ),
    );
  }
}
