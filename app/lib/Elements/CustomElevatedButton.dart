import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../colorThemes.dart';
import '../screens/HomeLayout.dart';
import '../screens/Signup.dart';
import '../screens/Signin.dart';

class CustomElevatedButton extends StatefulWidget {
  final String msg;
  final String nav;
  final List<TextEditingController> controllers;
  const CustomElevatedButton({super.key, required this.msg, required this.nav, required this.controllers});

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
          } else if(widget.nav=='otp'){
            bool isvalid=true;
            print("Signup called");
            for (var i in widget.controllers){
              if(i.text==''){
                isvalid=false;
                break;
              }
              print(i.text);
            };

            if(isvalid &&
                (widget.controllers[4].text==widget.controllers[3].text) &&
                (int.parse(widget.controllers[1].text)<10000000000 && int.parse(widget.controllers[1].text)>6000000000) &&
                ( RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(widget.controllers[2].text))
            ){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeLayout()),
              );
            }
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