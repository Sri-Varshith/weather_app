import 'dart:ui';

import 'package:flutter/material.dart';


class weatherscreen extends StatelessWidget{
  const weatherscreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color color_for_items_in_appbar = Color.fromARGB(255, 94, 132, 203);
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
                  Forecast_card(),
                  Forecast_card(),
                  Forecast_card(),
                  Forecast_card(),
              
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
              children: [
                SizedBox(
                  width: 120,
                  child:
                     Column(
                      children: [
                        Icon(Icons.water_drop,
                          size: 41,
                        ),
                        SizedBox(
                          height: 9,
                        ),
                        Text("Humidity",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w400
                          ),
                        ),
                        SizedBox(
                          height: 9,
                        ),
                        Text("VALue",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                  ),
                SizedBox(
                  width: 120,
                  child:
                     Column(
                      children: [
                        Icon(Icons.wind_power,
                          size: 41,
                        ),
                        SizedBox(
                          height: 9,
                        ),
                        Text("Wind Speed",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w400
                          ),
                        ),
                        SizedBox(
                          height: 9,
                        ),
                        Text("VALue",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                  ),
                SizedBox(
                  width: 120,
                  child:
                     Column(
                      children: [
                        Icon(Icons.speed,
                          size: 41,
                        ),
                        SizedBox(
                          height: 9,
                        ),
                        Text("Pressure",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w400
                          ),
                        ),
                        SizedBox(
                          height: 9,
                        ),
                        Text("VALue",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                  ),
                
              ],
            )
          ],
        ),
      ),
    );
  }

}

class Forecast_card extends StatelessWidget {
  const Forecast_card({super.key});

  @override
  Widget build(BuildContext context) {
          return SizedBox(
                width: 110,
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(13)),
                  color : const Color.fromARGB(255, 56, 62, 74),
                  child: Column(
                    children: [
                      SizedBox(height: 7,),
                      Text("Time",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17
                      ),),
                      SizedBox(height: 7,),
                      Icon(Icons.cloud,
                        size: 47,
                      ),
                      SizedBox(height: 7,),
                      Text("310 K",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17
                      ),),
                      SizedBox(height: 7,),

                    ],
                  ),
                ),
              );
  }
}