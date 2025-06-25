import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:weather_app/current_weather.dart';
import 'package:weather_app/myapikey.dart';
import 'forecast_card.dart';
import 'additional_info_card.dart';
import 'package:http/http.dart' as http;


class weatherscreen extends StatefulWidget{
  const weatherscreen({super.key});

  @override
  State<weatherscreen> createState() => _weatherscreenState();
}

class _weatherscreenState extends State<weatherscreen> {

  @override
  void initState() {
    super.initState();
    get_current_weather();
  }

  Future get_current_weather() async{
    try{
      String location = "Hyderabad";
      final result = await http.get(
        Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$location,IN&appid=$api_key"),
      );
      final data = jsonDecode(result.body);
      if(result.statusCode!=200){
        throw "Error occured";
      }
      else{
        print(data["main"]["temp"]);
        print(data["name"]);
      }
    }
    catch (e){
      throw e.toString();
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather App",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 27,
            color: Colors.white
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // will define the function later
            },
            icon: Icon(
              Icons.refresh,
              size: 32,
              color: Colors.white,
            )           
            )
          ],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          //main display
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CurrentWeather(icon: Icons.cloud,temperature: "310 K",weather: "Cloudy"),
            Padding(
              padding: const EdgeInsets.only(top: 11,bottom: 11),
              child: Text("Weather Forecast",style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24
              ),),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Forecast_card(icon: Icons.cloud,temperature: "310 K",time: "Time",),
                  Forecast_card(icon: Icons.cloud,temperature: "310 K",time: "Time",),
                  Forecast_card(icon: Icons.cloud,temperature: "310 K",time: "Time",),
                  Forecast_card(icon: Icons.cloud,temperature: "310 K",time: "Time",),
              
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 11,bottom: 11),
              child: Text("Additional Information",style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22
              ),),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
            additional_information_items(icon: Icons.water_drop,label: "Humidity",value: "value",),
            additional_information_items(icon: Icons.wind_power,label: "Wind Speed",value: "value",),
            additional_information_items(icon: Icons.speed,label: "Pressure",value: "value",),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                     Column(
                      children: [
                        Icon(Icons.sunny,
                          color: Colors.amber,
                          size: 43,
                        ),
                        SizedBox(
                          height: 11,
                        ),
                        Text("AM",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                        ),
                        )
                      ],
                    ),
                   Icon(CupertinoIcons.arrow_right,
                    size: 37
                  ),
                  
                     Column(
                      children: [
                        Icon(CupertinoIcons.moon_circle,
                          color: Colors.blueAccent,
                          size: 43,
                        ),
                        SizedBox(
                          height: 11,
                        ),
                        Text("PM",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                        ),
                        )
                      ],
                    ),
              ],
            )
          ],
        ),
      ),
    );
  }
}



