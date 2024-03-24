import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../colorThemes.dart';
import '../elements/CustomElevatedButton.dart';
import '../elements/CustomTextFields.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final nameController = TextEditingController();
  final mobController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confpassController = TextEditingController();
String dropdownvalue = 'Woman';
  var items = [
    'Woman',
    'Child',
  ];
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
                        height:50,
                      ),
                      Text(
                        "Sign Up",
                        style:TextStyle(
                            height: 3,
                            fontSize: 30,
                            color: currentTheme['VaultrixColor']
                        ),
                      ),
                      SizedBox(height:10),
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
                            CustomTextFields(hintText:'Name',controller: nameController,),
                            SizedBox(height:30),
                            CustomTextFields(hintText:'Mobile',controller: mobController,),
                            SizedBox(height:30),
                            CustomTextFields(hintText:'Email',controller: emailController,),
                            SizedBox(height:30),
                            CustomTextFields(hintText:'Password',controller: passwordController,),
                            SizedBox(height:30),
                            CustomTextFields(hintText:'Confirm Password',controller: confpassController,),
                            SizedBox(height:30),
                            Container(
                              width:MediaQuery.of(context).size.width-160,
                              decoration:BoxDecoration(
                                border:Border.all(color:currentTheme['VaultrixColor']!),
                                borderRadius: BorderRadius.circular(20),
                                color:currentTheme['InnerContainerColor'],
                              ),
                              child: Row(
                                mainAxisAlignment:MainAxisAlignment.center,
                                children:[
                                  Theme(
                                    data: Theme.of(context).copyWith(
                                    canvasColor: currentTheme['fillColor'],
                                  ),
                                  child: DropdownButton(
                                    value: dropdownvalue,
                                    iconDisabledColor:currentTheme['VaultrixColor'],
                                    iconEnabledColor:currentTheme['VaultrixColor'],
                                    focusColor:currentTheme['VaultrixColor'],
                                    icon: const Icon(Icons.keyboard_arrow_down),
                                    items: items.map((String items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Text(
                                          items,
                                          style: TextStyle(
                                            color:currentTheme['VaultrixColor'],
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        dropdownvalue = newValue!;
                                      });
                                      },
                                  ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height:50),
                            Row(
                              mainAxisAlignment:MainAxisAlignment.center,
                              children:[
                                CustomElevatedButton(
                                  msg:"Sign In",
                                  nav:'signin',
                                  controllers: [nameController,mobController,emailController,passwordController,confpassController],
                                ),
                                SizedBox(width:50),
                                CustomElevatedButton(
                                  msg:"Sign Up",
                                  nav:'otp',
                                  controllers: [nameController,mobController,emailController,passwordController,confpassController],
                                  option: dropdownvalue,
                                ),
                              ],
                            ),
                            const SizedBox(height:50),
                          ],
                        ),
                      ),
                      SizedBox(
                        height:MediaQuery.of(context).size.height-770,
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