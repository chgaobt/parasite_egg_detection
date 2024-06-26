import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parasite_egg_detection/splash.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.robotoFlexTextTheme(),
      ),
      home: const splash(),
    );
  }
}