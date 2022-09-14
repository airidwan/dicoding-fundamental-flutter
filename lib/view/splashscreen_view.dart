import 'package:flutter/material.dart';

import 'dart:async';

import 'package:submission_restaurantapp/data/routes_nav.dart';


class SplashscreenView extends StatefulWidget {
  const SplashscreenView({Key? key}) : super(key: key);

  @override
  State<SplashscreenView> createState() => _SplashscreenViewState();
}

class _SplashscreenViewState extends State<SplashscreenView> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 2),
      () => Navigator.pushReplacementNamed(context, RoutesName.home),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            // 'Submission Dicoding'.text.bold.make(),
            // 'Flutter Fundamental'.text.extraBold.make(),
            CircleAvatar(
              backgroundImage: AssetImage('assets/icon.png'),
            ),
            const SizedBox(
              width: 100.0,
              height: 100.0,
              child: CircularProgressIndicator(strokeWidth: 10),
            ),
          ],
        ),
      ),
    );
  }
}

class MyHomePage {
}
