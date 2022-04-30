import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:splash_page/pages/sign_in_page.dart';
import 'package:page_transition/page_transition.dart';

class SplashPage extends StatefulWidget {
  static const String id = "splash_page";

  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.fade,
      splash: Stack(
        children: [
          Container(
            child: Center(
              child: Image.asset("assets/images/img_1.png",fit: BoxFit.cover,),
            ),
          ),
          SizedBox(
            height: 20,
          ),

        ],
      ),
      nextScreen: SignInPage(),
      backgroundColor: Color(0xff193889),
      duration: 1000,
      splashIconSize: 200,
      animationDuration: Duration(seconds: 1),
    );
  }
}
