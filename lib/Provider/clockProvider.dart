import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Clockprovider with ChangeNotifier {
  DateTime myTime = DateTime.now();

  Clockprovider() {
    getTime();
  }

  Future<void> updateTime() async {
    await Future.delayed(Duration(seconds: 1));
    myTime = myTime.add(Duration(seconds: 1));
    // print('hello');

    notifyListeners();
    await updateTime();
  }

  void getTime() async {
    try {
      var response = await http.get(
          Uri.parse('https://worldtimeapi.org/api/timezone/Asia/Kathmandu'));
      if (response.statusCode == 200) {
        var decodedInfo = jsonDecode(response.body);
        String myDateTime = decodedInfo['datetime'];
        myTime = DateTime.parse(myDateTime);
        print(myTime);
        notifyListeners();
      } else {
        print("ERROR");
      }
    } catch (e) {
      throw Exception("ERROR OCCURS: $e");
    }
  }
}
