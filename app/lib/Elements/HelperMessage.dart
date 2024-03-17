
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
class HelperMessage extends StatefulWidget {
  final String msg;
  final Map<String,Color> currentTheme;
  const HelperMessage({super.key, required this.msg, required this.currentTheme});
  @override
  State<HelperMessage> createState() => _HelperMessageState();
}

class _HelperMessageState extends State<HelperMessage> {
  @override
  Widget build(BuildContext context){
    return ElevatedButton(
        onPressed: (){
          print(widget.msg);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.currentTheme['HelperBgColor'],
          foregroundColor: Colors.white,
          minimumSize:Size(100,40),
          shadowColor: Colors.grey,
          splashFactory: InkRipple.splashFactory,
        ),
        child: Text(widget.msg));
  }
}

