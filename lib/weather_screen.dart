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
          crossAxisAlignment: CrossAxisAlignment.center,
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

          ],
        ),
      ),
    );
  }

}