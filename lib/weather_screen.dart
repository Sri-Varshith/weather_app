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
            color: color_for_items_in_appbar
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
              color: color_for_items_in_appbar,
              

            )
            
            )
          ],
        centerTitle: true,
      ),


    );
  }

}