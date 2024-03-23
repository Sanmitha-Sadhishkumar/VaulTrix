import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../colorThemes.dart';

class CustomTextFields extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  const CustomTextFields({super.key, required this.hintText, required this.controller});

  @override
  State<CustomTextFields> createState() => _CustomTextFieldsState();
}

class _CustomTextFieldsState extends State<CustomTextFields> {
  String text = "No Value Entered";
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
          controller:widget.controller,
          decoration: InputDecoration(
          hintText: widget.hintText,
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
