// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  String? imagePath; 
  XFile? image; 
  int? count; 

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
              // height: 150,
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

                        //phone ip adderess 172.20.10.2
                        print(file.readAsBytes().asStream());
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
                        var streamedResponse = await request.send();
                        var res = await http.Response.fromStream(streamedResponse);
                        final data = jsonDecode(res.body);
                        if(res.statusCode == 200) {
                          setState(() {
                            count = data;
                          });
                        }
      
                        print('post request made');
                      
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.camera_alt_outlined,size: 100,)
                        ],
                      )
                    ),
                    Text(
                      'Number of parasite eggs were detected: $count',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15
                      ),
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