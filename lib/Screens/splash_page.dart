import 'package:flutter/material.dart';
import 'register.dart';

class Splash_Page extends StatefulWidget {
  const Splash_Page({Key? key}) : super(key: key);

  @override
  State<Splash_Page> createState() => _Splash_PageState();
}

class _Splash_PageState extends State<Splash_Page> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(Duration(seconds: 2), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => register()));
    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MenuButton()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Image.asset(
          "images/Landing Page.png",
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.cover,
        ),
      ],
    ));
  }
}
