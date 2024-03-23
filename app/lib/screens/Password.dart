import 'package:app/elements/QuickAccessTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../elements/SettingsDrawer.dart';
import '../elements/CustomElevatedButton.dart';
import '../colorThemes.dart';
import '../elements/CustomTextFields.dart';

class ChangePasswordLayout extends StatefulWidget {
  ChangePasswordLayout({super.key});

  @override
  State<ChangePasswordLayout> createState() => _ChangePasswordLayoutState();
}

class _ChangePasswordLayoutState extends State<ChangePasswordLayout> {
  final currController = TextEditingController();
  final newController = TextEditingController();
  final confController = TextEditingController();
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
                          CustomElevatedButton(msg: 'Back', nav: 'Home',controllers: [],),
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
                          CustomTextFields(
                            hintText: 'Current Password',
                            controller: currController,
                          ),
                          SizedBox(height:10),
                          CustomElevatedButton(msg: 'Confirm', nav:'',controllers: [currController],),
                          SizedBox(height:40),
                          CustomTextFields(
                            hintText: 'New Password',
                            controller: newController,
                          ),
                          SizedBox(height:10),
                          CustomTextFields(
                            hintText: 'Confirm Password',
                            controller: confController,
                          ),
                          SizedBox(height:10),
                          CustomElevatedButton(msg: 'Change', nav: '',controllers: [newController,confController],),
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
