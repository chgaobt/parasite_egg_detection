import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children:[
          SizedBox(
            height: MediaQuery.of(context).size.height/1.2,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              'images/homeScreen.png',
              fit: BoxFit.fill,
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: 80,
            width: 160,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 144, 169, 85),
              borderRadius: BorderRadius.circular(25),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                "Add/Take a Photo",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                ),
              ),
            )
          ),
        ],
      )
    );
  }
}