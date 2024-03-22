import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../colorThemes.dart';
import '../elements/CustomTextFields.dart';
import '../elements/CustomElevatedButton.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: <Widget>[Flexible(
          flex: 2,
          fit: FlexFit.tight,
          child:Container(
            color: currentTheme['OuterContainerColor'],
            child: Column(
              children:<Widget>[
                Container(
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft:Radius.circular(20),
                        bottomRight:Radius.circular(20),
                      ),
                    ),
                    color: currentTheme['InnerContainerColor'],
                  ),

                  child:Column(
                    children: <Widget>[
                      SizedBox(
                        width:MediaQuery.of(context).size.width,
                        height:200,
                      ),
                      Text(
                        "Sign In",
                        style:TextStyle(
                            height: 3,
                            fontSize: 30,
                            color: currentTheme['VaultrixColor']
                        ),
                      ),
                      SizedBox(height:20),
                      Container(
                        width: MediaQuery.of(context).size.width-80,
                        decoration:BoxDecoration(
                          border:Border.all(color:currentTheme['VaultrixColor']!),
                          borderRadius: BorderRadius.circular(20),
                          color:currentTheme['OuterContainerColor'],
                        ),
                        child:Column(
                          children:[
                            SizedBox(height:50),
                            CustomTextFields(hintText:'Your Email'),
                            SizedBox(height:30),
                            CustomTextFields(hintText:'Password'),
                            SizedBox(height:50),
                            Row(
                              mainAxisAlignment:MainAxisAlignment.center,
                              children:[
                                CustomElevatedButton(
                                  msg:"Sign In",
                                  nav:'otp',
                                ),
                                SizedBox(width:50),
                                CustomElevatedButton(
                                  msg:"Sign Up",
                                  nav:'signup',
                                ),
                              ],
                            ),
                            SizedBox(height:50),
                          ],
                        ),
                      ),
                      SizedBox(
                        height:MediaQuery.of(context).size.height-640,
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height:20,
                  child:Text(
                    "VaulTrix",
                    style:TextStyle(
                        height: 2,
                        //fontSize: 10,
                        color: currentTheme['VaultrixColor']
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        ],
      ),
    );
  }
}