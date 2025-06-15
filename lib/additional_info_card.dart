import 'package:flutter/material.dart';

class additional_information_items extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  const additional_information_items({
    super.key,
    required this.icon,
    required this.label,
    required this.value
  });

  @override
  Widget build(BuildContext context) {
    return Column(
     children: [
       Icon(icon,
         size: 41,
       ),
       SizedBox(
         height: 9,
       ),
       Text(label,
         style: TextStyle(
           color: Colors.white,
           fontSize: 17,
           fontWeight: FontWeight.w400
         ),
       ),
       SizedBox(
         height: 9,
       ),
       Text(value,
         style: TextStyle(
           color: Colors.white,
           fontSize: 19,
           fontWeight: FontWeight.bold
         ),
       ),
     ],
    );
  }
}