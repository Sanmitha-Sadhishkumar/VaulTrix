import 'package:app/elements/QuickAccessTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../elements/SettingsDrawer.dart';
import '../elements/CustomElevatedButton.dart';
import '../colorThemes.dart';

class ChangePasswordLayout extends StatefulWidget {
  const ChangePasswordLayout({super.key});

  @override
  State<ChangePasswordLayout> createState() => _ChangePasswordLayoutState();
}

class _ChangePasswordLayoutState extends State<ChangePasswordLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor:currentTheme["InnerContainerColor"],
        foregroundColor:currentTheme["VaultrixColor"],
      ),
      drawer: SettingsDrawer(),
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
                  children:<Widget>[
                    SizedBox(
                      height: 50,
                      child: Row(
                        children: <Widget>[
                          SizedBox(width: MediaQuery.of(context).size.width-120,),
                          CustomElevatedButton(msg: 'Back', nav: 'Home'),
                        ],
                      ),
                    ),
                    SizedBox(height:20,width:2400),
                    Text(
                      "Change Password",
                      style:TextStyle(
                          height: 3,
                          fontSize: 30,
                          color: currentTheme['VaultrixColor']
                      ),
                    ),
                    SizedBox(height: 30,),
                    Container(
                      height: 350,
                      width: 320,
                      decoration: BoxDecoration(
                        color: currentTheme['OuterContainerColor'],
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color:Colors.white),
                      ),
                      child:Column(
                        children: [
                          SizedBox(height:30),
                          const QuickAccessFields(
                            hintText: 'Current Password',
                          ),
                          SizedBox(height:10),
                          CustomElevatedButton(msg: 'Confirm', nav:''),
                          SizedBox(height:40),
                          const QuickAccessFields(
                            hintText: 'New Password',
                          ),
                          SizedBox(height:10),
                          const QuickAccessFields(
                            hintText: 'Confirm Password',
                          ),
                          SizedBox(height:10),
                          CustomElevatedButton(msg: 'Change', nav: ''),
                        ],
                      ),
                    ),
                    SizedBox(height:MediaQuery.of(context).size.height-660),
                  ],
                ),
              ),

              SizedBox(
                height:20,
                child:Text(
                  "VaulTrix",
                  style:TextStyle(
                      height: 2,
                      fontSize: 15,
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
