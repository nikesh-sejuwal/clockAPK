import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Clockprovider with ChangeNotifier {
  DateTime myTime = DateTime.now();
  Map<String, dynamic> weather = {};
  String city = 'Pokhara';

  changeCity(String ci) {
    city = ci;
    getWeather(city);
    notifyListeners();
  }

  Clockprovider() {
    getTime();
    getWeather(city);
  }

  Future<void> updateTime() async {
    await Future.delayed(Duration(seconds: 1));
    myTime = myTime.add(Duration(seconds: 1));
    // print('hello');

    notifyListeners();
    await updateTime();
  }

  void functioncall() {
    getTime();
    getWeather(city);
  }

  void getTime() async {
    try {
      var response = await http.get(
          Uri.parse('https://worldtimeapi.org/api/timezone/Asia/Kathmandu'));
      if (response.statusCode == 200) {
        var decodedInfo = jsonDecode(response.body);
        String myDateTime = decodedInfo['datetime'];
        myTime = DateTime.parse(myDateTime);
        myTime = myTime.add(Duration(hours: 5, minutes: 45));
        print(myTime);
        notifyListeners();
      } else {
        print("ERROR");
      }
    } catch (e) {
      throw Exception("ERROR OCCURS: $e");
    }
  }

  void getWeather(String city) async {
    try {
      var response = await http.get(Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=eb1ecbbf5b3f92f014962bb412ae336a&units=metric'));
      if (response.statusCode == 200) {
        var decodedInfo = jsonDecode(response.body);
        weather = decodedInfo;
        notifyListeners();
        print('${weather}');
      }
    } catch (e) {
      print("ERROR AT $e");
    }
  }
}
