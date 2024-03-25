// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'package:parasite_egg_detection/home.dart';


class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> with SingleTickerProviderStateMixin{

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => home()));
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: SystemUiOverlay.values
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height/1.077,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'images/splashScreen.png',
                fit: BoxFit.fill
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Parasite Egg Detector',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.black,
                fontSize: 32,
              ),
            )
          ],
        ),
    );
  }
}