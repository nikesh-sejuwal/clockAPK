import 'package:clock_task/Provider/myProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WeatherMethod extends StatelessWidget {
  const WeatherMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Clockprovider>(builder: (context, wProv, child) {
      String getImagePath() {
        if (wProv.weather['weather'] != null &&
            wProv.weather['weather'].isNotEmpty) {
          if (wProv.weather['weather'][0]['main'] == 'Clouds') {
            return 'lib/images/clouds.png';
          } else if (wProv.weather['weather'][0]['main'] == 'Rain') {
            return 'lib/images/rain.png';
          } else if (wProv.weather['weather'][0]['main'] == 'Dizzle') {
            return 'lib/images/dizzle.png';
          } else if (wProv.weather['weather'][0]['main'] == 'Snow') {
            return 'lib/images/snow.png';
          } else if (wProv.weather['weather'][0]['main'] == 'Mist') {
            return 'lib/images/mist.png';
          } else if (wProv.weather['weather'][0]['main'] == 'Clear') {
            return 'lib/images/clear.png';
          } else {
            return 'lib/images/search.png';
          }
        } else {
          return 'lib/images/search.png';
        }
      }

      return Container(
        width: MediaQuery.of(context).size.width * 0.95,
        decoration: BoxDecoration(
            color: Color(0xff212333),
            border: Border.all(width: 2, color: Colors.white),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                offset: Offset(1, 1),
                blurRadius: 7,
                spreadRadius: 3,
                color: Colors.black,
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25),
          child: Column(
            children: [
              Text(
                '${wProv.city}',
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.yellow),
              ),
              SizedBox(height: 10),
              Text(
                '${wProv.weather['weather'] != null && wProv.weather['weather'].isNotEmpty ? wProv.weather['weather'][0]['description'] : 'Loading'}',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              SizedBox(height: 10),
              Image.asset(
                getImagePath(),
                height: 70,
                width: 70,
                fit: BoxFit.cover,
              ),
              Text(
                '${wProv.weather['weather'] != null && wProv.weather['weather'].isNotEmpty ? wProv.weather['main']['temp'].round() : "Loading..."}°c',
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Image.asset('lib/images/humidity.png',
                          height: 30, width: 30, fit: BoxFit.cover),
                      SizedBox(width: 10),
                      Text(
                        '${wProv.weather['weather'] != null && wProv.weather['weather'].isNotEmpty ? wProv.weather['main']['humidity'] : "Loading..."}',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset('lib/images/wind.png',
                          height: 30, width: 30, fit: BoxFit.cover),
                      SizedBox(width: 10),
                      Text(
                        '${wProv.weather['weather'] != null && wProv.weather['weather'].isNotEmpty ? wProv.weather['wind']['speed'] : "Loading..."}',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
