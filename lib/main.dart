

import 'package:flutter/material.dart';
import 'package:weather_app/weather_screen.dart';
void main(){
  runApp(const myapp());
}

class myapp extends StatelessWidget{
  const myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true),
      home: const weatherscreen(),
    );
  }
}