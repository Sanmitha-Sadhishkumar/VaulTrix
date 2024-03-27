import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../colorThemes.dart';
import '../screens/HomeLayout.dart';
import '../screens/Signup.dart';
import '../screens/Signin.dart';
import '../firebase_methods/addUser.dart';
import '../firebase_methods/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:app/firebase_methods/user_module.dart';

class CustomElevatedButton extends StatefulWidget {
  final String msg;
  final String nav;
  final List<TextEditingController> controllers;
  String option='';
  CustomElevatedButton({super.key, required this.msg, required this.nav, required this.controllers, this.option=''});

  @override
  State<CustomElevatedButton> createState() => _CustomElevatedButtonState();
}

class _CustomElevatedButtonState extends State<CustomElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () async {

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
            final authService = Provider.of<AuthService>(context, listen: false);
            authService.signInWithEmailAndPassword(
              widget.controllers[2].text,
              widget.controllers[3].text,
            );
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Signin()),
            );
          } else if(widget.nav=='otpsignup'){
            final authService = Provider.of<AuthService>(context, listen: false);
            User? u = await authService.createuserWithEmailAndPassword(
              widget.controllers[2].text,
              widget.controllers[3].text,
            );
            addUserToFirestore(
                  name: widget.controllers[0].text,
                  mobile: widget.controllers[1].text,
                  email: widget.controllers[2].text,
                  password: widget.controllers[3].text,
                  confPassword: widget.controllers[4].text,
                  userType: widget.option,
                  uid : u!.uid,
              );
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeLayout()),
              );
          } else if(widget.nav=='otpsignin'){
            final authService = Provider.of<AuthService>(context, listen: false);
            authService.signInWithEmailAndPassword(
              widget.controllers[0].text,
              widget.controllers[1].text,
            );
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeLayout()),
              );
          } else if (widget.nav=='QAL'){
            addQALToFirestore(
                name:widget.controllers[0].text,
                mobile:widget.controllers[1].text,
                relation:widget.controllers[2].text
            );
          }
        } ,
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