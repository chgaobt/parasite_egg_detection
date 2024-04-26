// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:parasite_egg_detection/request.dart';
import 'package:dio/dio.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  String? imagePath; 
  XFile? image; 
  int count = -1; 

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
                'Select a Photo',
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
                        final ImagePicker _picker = ImagePicker();
                        final PickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
                        File file = File(PickedFile!.path); 

                        var request = http.MultipartRequest('POST', Uri.parse('http://172.20.10.2'));
                        Map<String, String> headers = {"Content-type": "multipart/form-data"};
                        request.files.add(
                          await http.MultipartFile(
                            'imagefile',
                            file.readAsBytes().asStream(),
                            file.lengthSync(),
                            filename: "filename",
                          )
                        );
                        request.headers.addAll(headers);
                        print("request: " + request.toString());
                        var res = await request.send();
                        print('post request made with await');
                        
                        //int count = -1; 
                        var data = await http.get(Uri.parse('http://172.20.10.2'));
                        if(data.statusCode == 200) {
                          setState(() {
                            count = jsonDecode(data.body);
                          });
                          //count = 0;
                        }
                        else {
                          throw Exception('Failed to get from Flask server');
                        }
                      
                        print(count);

                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.camera_alt_outlined,size: 100,)
                        ],
                      )
                    ),
                    Text(
                      'This many parasite eggs were detected: $count'
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