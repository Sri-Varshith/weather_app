import 'package:flutter/material.dart';

class Forecast_card extends StatelessWidget {
  final IconData icon;
  final String time;
  final String temperature;
  const Forecast_card({super.key,
    required this.icon,
    required this.temperature,
    required this.time,
  });
  
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
                      Text(time,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17
                      ),),
                      SizedBox(height: 7,),
                      Icon(icon,
                        size: 47,
                      ),
                      SizedBox(height: 7,),
                      Text(temperature,
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