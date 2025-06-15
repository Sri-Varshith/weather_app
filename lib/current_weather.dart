import 'package:flutter/material.dart';
import 'dart:ui';

class CurrentWeather extends StatelessWidget {
  final IconData icon;
  final String weather;
  final String temperature;
  const CurrentWeather({super.key,
    required this.icon,
    required this.temperature,
    required this.weather,
  });

  @override
  Widget build(BuildContext context) {
    return 
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
                          Text(temperature,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30
                            ),
                          ),
                          Icon(
                            color: Colors.white,
                            icon,
                            size: 80,
                          ),
                          Text(weather,
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
            )
    ;
  }
}