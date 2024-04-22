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
  String? imagePath; 
  XFile? image; 

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
                      onPressed: () async {
                        final PickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
                        // if(PickedFile != null){
                        //   setState(() {
                        //     image = XFile(PickedFile.path);
                        //   });
                        //   print(PickedFile.path);
                        // }
                      },
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
    );
  }
}