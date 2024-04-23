import 'dart:convert';

import 'package:http/http.dart';

Future getData(url) async {
  Response response = await get(Uri.parse(url));
  if (response.statusCode == 200 && response.body.isNotEmpty) {
    return jsonDecode(response.body);
  } 
  else {
    throw Exception('Failed to load data from server');
  }
}