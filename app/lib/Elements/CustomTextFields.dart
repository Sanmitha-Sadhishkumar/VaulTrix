import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../colorThemes.dart';

class CustomTextFields extends StatelessWidget {
  final String hintText;
  const CustomTextFields({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(0),
        color: currentTheme['HelperBgColor'],
      ),
      width: 250,
      height: 40,
      child:Material(
        child:TextField(
          decoration: InputDecoration(
            hintText: this.hintText,
            filled: true,
            fillColor: currentTheme['fillColor'],
          ),
          style: TextStyle(fontSize: 16.0, height: 2.0, color: Colors.black),
          cursorHeight: 16,
          cursorOpacityAnimates: true,
        ),
      ),
    );
  }
}