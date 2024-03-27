import '../colorThemes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class HelperMessage extends StatefulWidget {
  final String msg;
  final TextEditingController controllers;
  const HelperMessage({super.key, required this.msg, required this.controllers});
  @override
  State<HelperMessage> createState() => _HelperMessageState();
}

class _HelperMessageState extends State<HelperMessage> {
  @override
  Widget build(BuildContext context){
    return ElevatedButton(
        onPressed: (){
          widget.controllers.text = widget.msg;
          print(widget.msg);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: currentTheme['HelperBgColor'],
          foregroundColor: Colors.white,
          minimumSize:Size(100,40),
          shadowColor: Colors.grey,
          splashFactory: InkRipple.splashFactory,
        ),
        child: Text(widget.msg));
  }
}

