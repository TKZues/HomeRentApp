import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/config/size_config.dart';

class TextCustom extends StatelessWidget {
  final String text;     
  final double fontSize;  
  final Color color;   
  final FontWeight fontWeight;
  final TextAlign textAlign;
  const TextCustom({super.key, 
    required this.text,
    this.fontSize = 14.0,
    this.color = Colors.black,
    this.fontWeight = FontWeight.w400,
    this.textAlign = TextAlign.left,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: psHeight(fontSize),
        color: color,
        fontWeight: fontWeight,
      ),
      textAlign: textAlign,
    );
  }
}
