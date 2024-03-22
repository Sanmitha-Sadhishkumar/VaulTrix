import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../colorThemes.dart';
import '../screens/HomeLayout.dart';
import '../screens/Signup.dart';
import '../screens/Signin.dart';

class CustomElevatedButton extends StatefulWidget {
  final String msg;
  final String nav;
  const CustomElevatedButton({super.key, required this.msg, required this.nav});

  @override
  State<CustomElevatedButton> createState() => _CustomElevatedButtonState();
}

class _CustomElevatedButtonState extends State<CustomElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: (){
          if(widget.nav=='Home'){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeLayout()),
            );
          } else if(widget.nav=='signup'){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Signup()),
            );
          } else if(widget.nav=='signin'){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Signin()),
            );
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: currentTheme['HelperBgColor'],
          foregroundColor: Colors.white,
          minimumSize:Size(100,40),
          shadowColor: Colors.grey,
          splashFactory: InkRipple.splashFactory,
        ),
        child: Text(widget.msg)
    );
  }
}