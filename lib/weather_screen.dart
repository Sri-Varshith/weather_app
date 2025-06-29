import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:weather_app/current_weather.dart';
import 'package:weather_app/myapikey.dart';
import 'forecast_card.dart';
import 'additional_info_card.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';



class weatherscreen extends StatefulWidget{
  const weatherscreen({super.key});

  @override
  State<weatherscreen> createState() => _weatherscreenState();
}

class _weatherscreenState extends State<weatherscreen> {
  late Future<Map<String,dynamic>> weather = fetchWeatherData();
  @override
  void initState() {
    super.initState();
    weather = fetchWeatherData();
  }
  Future<Map<String, dynamic>> fetchForecast() async {
  String location = "Hyderabad";
  final response = await http.get(
    Uri.parse("https://api.openweathermap.org/data/2.5/forecast?q=$location,IN&appid=$api_key"),
  );

  if (response.statusCode != 200) {
    throw "Forecast API error";
  }

  return jsonDecode(response.body);
}
  Future<Map<String,dynamic>> get_current_weather() async{
    try{
      String location = "Hyderabad";
      final result = await http.get(
        Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$location,IN&appid=$api_key"),
      );
      final data = jsonDecode(result.body);
      if(result.statusCode!=200){
        throw "Error occured";
      }
      return data;

    }
    catch (e){
      throw e.toString();
    }
    
  }
  Future<Map<String, dynamic>> fetchWeatherData() async {
  final currentWeather = get_current_weather();
  final forecast = fetchForecast();

  final results = await Future.wait([currentWeather, forecast]);

  return {
    'current': results[0],
    'forecast': results[1],
  };
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
              setState(() {
                weather = fetchWeatherData();
              });
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
      body: FutureBuilder(
        future: weather,
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return LinearProgressIndicator();
          }
          if(snapshot.hasError){
            return Text(snapshot.error.toString());
          }

          // we have already checked whether the data can be nullable so we can can directly fetch data otherwise its always a safer option to use the following way:

          final data = snapshot.data!["current"];
          final curr_temp = data["main"]["temp"];
          final curr_weather = data["weather"][0]["main"];
          final curr_humidity = data["main"]["humidity"].toString();
          final curr_pressure = data["main"]["pressure"].toString();
          final curr_wind_speed = data["wind"]["speed"].toString();
          const weather_details = {
            "Clouds" : Icons.cloud,
            "Rain" : CupertinoIcons.cloud_rain_fill,
            "Thunderstorm" : CupertinoIcons.cloud_rain_fill,
            "Drizzle" : CupertinoIcons.cloud_rain_fill,
            "Snow" : CupertinoIcons.cloud_snow,
            "Clear" : Icons.sunny,

          };
          
          int sunriseUnix = data["sys"]["sunrise"]; // from API
          int sunsetUnix = data["sys"]["sunset"];  // from API

          final sunrise = DateTime.fromMillisecondsSinceEpoch(sunriseUnix * 1000).toLocal();
          final sunset = DateTime.fromMillisecondsSinceEpoch(sunsetUnix * 1000).toLocal();

          final timeFormat = DateFormat.jm(); // e.g. "6:00 AM"
          // safer way of doing it:
          // if(snapshot.data!=null){

          // }
          final forecast_data = snapshot.data!["forecast"]["list"];



          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              //main display
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CurrentWeather(icon: weather_details[curr_weather]!,temperature: "$curr_temp K",weather: curr_weather),
                Padding(
                  padding: const EdgeInsets.only(top: 11,bottom: 11),
                  child: Text("Weather Forecast",style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24
                  ),),
                ),

                SizedBox(
                  height: 137,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (context,index) {
                      final curr_time_unix=forecast_data[index+1]["dt"];
                      final curr_time = DateTime.fromMillisecondsSinceEpoch(curr_time_unix * 1000).toLocal();
                        return Forecast_card(
                          icon: weather_details[forecast_data[index+1]["weather"][0]["main"]]!,
                          temperature: "${forecast_data[index+1]["main"]["temp"]} K",
                          time: timeFormat.format(curr_time),);
                    },
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
                additional_information_items(icon: Icons.water_drop,label: "Humidity",value: curr_humidity,),
                additional_information_items(icon: Icons.wind_power,label: "Wind Speed",value: curr_wind_speed,),
                additional_information_items(icon: Icons.speed,label: "Pressure",value: curr_pressure,),
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
                            Text(timeFormat.format(sunrise),
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
                            Text(timeFormat.format(sunset),
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
          );
        }
      ),
    );
  }
}



