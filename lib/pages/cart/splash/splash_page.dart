import 'dart:async';
import 'package:flutter/material.dart';
import 'package:foodie_app/pages/welcome_page.dart';

import '../../../gen/assets.gen.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 2000), () {
      Route route = MaterialPageRoute(
        builder: (context) => const WelcomePage(),
      );
      Navigator.pushAndRemoveUntil(
        context,
        route,
        (Route<dynamic> route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      //C1:
      // body: Stack(
      //   children: [
      //     Image.asset(
      //       Assets.images.background.path,
      //       width: size.width,
      //       height: size.height,
      //       fit: BoxFit.fill,
      //     ),
      //     Center(
      //       child: Image.asset(
      //         Assets.images.logo1.path,
      //         width: 160.0,
      //       ),
      //     ),
      //   ],
      // ),
      //C2:
      body: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.images.background.path),
            fit: BoxFit.fill,
          ),
        ),
        child: Image.asset(Assets.images.logo1.path, width: 160.0),
      ),
    );
  }
}
