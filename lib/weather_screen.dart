import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'forecast_card.dart';
import 'additional_info_card.dart';


class weatherscreen extends StatelessWidget{
  const weatherscreen({super.key});

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
            SizedBox(
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(12),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10,sigmaY: 10),
                  child: Card(
                    elevation: 2,
                      color : const Color.fromARGB(255, 56, 62, 74),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(19)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("310 K",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30
                            ),
                          ),
                          Icon(
                            color: Colors.white,
                            Icons.cloud,
                            size: 80,
                          ),
                          Text("Cloudy",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
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



