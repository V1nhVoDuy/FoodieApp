import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodie_app/pages/authen/login_page.dart';
import 'package:foodie_app/pages/authen/register_page.dart';

import '../components/button/app_elevated_button.dart';
import '../gen/assets.gen.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();
    // đổi màu
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Image.asset(
              Assets.images.logo2.path,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
              left: 0.0,
              top: size.height / 2.0,
              right: 0.0,
              bottom: 72.0,
              child: Column(
                children: [
                  const Text(
                    'Welcome',
                    style: TextStyle(color: Colors.red, fontSize: 30.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0)
                        .copyWith(top: 8.0),
                    child: const Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                      style: TextStyle(color: Colors.brown, fontSize: 18.0),
                      // overflow: TextOverflow.fade,
                      textAlign: TextAlign.center,
                      // textScaleFactor: 1,
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: AppElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (context) => const LoginPage(),
                              ),
                              (Route<dynamic> route) => false);
                        },
                        text: 'Login'),
                  ),
                  const SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: AppElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (context) => const RegisterPage(),
                              ),
                              (Route<dynamic> route) => false);
                        },
                        text: 'Sign up'),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
