import 'package:flutter/material.dart';
import 'package:moneyfreedom/Screens/splash_page.dart';

class App extends StatelessWidget{
  const App({super.key});

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: MenuButton(),

      home: Splash_Page(),
      // home: AnimatedSplashScreen(
      //   splash: Image.asset(
      //     'images/logo_bg_biru.png',
      //     width: 150,
      //     height: 150,
      //   ),
      //   nextScreen: const MenuButton(),
      //   splashTransition: SplashTransition.fadeTransition,
      //   backgroundColor: const Color(0xFF0080FF),
      //   splashIconSize: 150,

      // ),
    );
  }

}