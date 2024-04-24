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
                        var request = http.MultipartRequest('POST', Uri.parse('http://127.0.0.1:5000/'));
                        request.files.add(await http.MultipartFile.fromPath('imagefile', file.path));


                        try {
                          var res = await request.send();
                          if(res.statusCode == 200) {
                            var data = await getData('http://127.0.0.1:5000/');
                            var decodedData = jsonDecode(data);
                            print(decodedData['query']);
                            print('done');
                          }
                          else {
                            print('failed to send');
                          }
                        }
                        catch (e) {
                          print('Error sending photo: ${e}');
                        }                        
                        //var data = await res.stream.bytesToString();
                    
                        print('sent photo');
                        //showAlertDialog(context, decodedData['query']);
                        //print(decodedData['query'][0]);
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

