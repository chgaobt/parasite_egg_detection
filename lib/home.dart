// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/homeScreen.png'),
                  fit: BoxFit.fill
                ),
              )
            ),
            Container(
              alignment: Alignment.center,
              // height: 200,
              // width: 150,
              child: Text(
                'Take/Select a Photo',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Container(
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 500,
                    ),
                    ElevatedButton(
                onPressed: () async{}, 
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.camera_alt_outlined,size: 100,)
                  ],
                )
              ),
                  ],
                ), 
              )
            ),
          ],
         ),
      //   child: Center(
      //     child: SingleChildScrollView(
      //       child: Column(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           SizedBox(
      //             height: MediaQuery.of(context).size.height,
      //             width: MediaQuery.of(context).size.width,
      //             child: Image.asset(
      //               'images/homeScreen.png',
      //               fit: BoxFit.fill,
      //             ),
      //           ),
      //           const Positioned(
      //             top: 350,
      //             left: 170,
      //             child: Text(
      //             "Select/Take a Photo",
      //             textAlign: TextAlign.center,
      //             style: TextStyle(
      //               fontSize: 35,
      //               fontWeight: FontWeight.bold,
      //               color: Colors.black
      //             ),
      //           ),
      //           ),
                
                  
      //           // ElevatedButton(
      //           //   onPressed: () async {
      //           //   }, 
      //           //   child: Row(
      //           //     mainAxisSize: MainAxisSize.min,
      //           //     children: [
      //           //       Icon(Icons.camera_alt_outlined, size: 100),
      //           //     ]
      //           //   )
      //      
    );
  }
}