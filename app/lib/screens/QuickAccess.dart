import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../Elements/QuickAccessTile.dart';
import '../Elements/SettingsDrawer.dart';
import '../colorThemes.dart';
import '../screens/HomeLayout.dart';
import '../Elements/CustomElevatedButton.dart';

class QuickAccessList extends StatelessWidget {
  const QuickAccessList({super.key });

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
                    children: <Widget>[
                      SizedBox(
                        height: 50,
                        child: Row(
                          children: <Widget>[
                            SizedBox(width: 300,),
                            CustomElevatedButton(msg: 'Back', nav: 'Home'),
                          ],
                        ),
                      ),
                      Text(
                        "Quick Access List",
                        style:TextStyle(
                            height: 3,
                            fontSize: 30,
                            color: currentTheme['VaultrixColor']
                        ),
                      ),
                      SizedBox(height: 20,),

                      //Todo
                      QuickAccessTile(ContactName: "Dhivya", ContactNum: '8248701899', ContactRelation: 'Friend',),
                      SizedBox(height: 20,),
                      QuickAccessTile(ContactName: "Sadhish", ContactNum: '9344944110', ContactRelation: 'Dad',),
                      SizedBox(height: 40,),

                      Container(
                          height: 300,
                          width: 330,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white,),
                              borderRadius: BorderRadius.circular(20),
                              color: currentTheme['HelperBgColor'],
                          ),
                          child: Column(
                              children: <Widget>[
                                  SizedBox(
                                    height: 50,
                                    child:Text(
                                        "Add new Contact:",
                                        style: TextStyle(
                                          fontSize: 20,
                                          height:3,
                                          color: currentTheme['VaultrixColor'],
                                        ),
                                    ),
                                  ),
                                  SizedBox(height: 30,),
                                  QuickAccessFields(hintText: 'Contact Name'),
                                  SizedBox(height: 10,),
                                  QuickAccessFields(hintText: 'Contact Number'),
                                  SizedBox(height: 10,),
                                  QuickAccessFields(hintText: 'Contact Relation'),
                                  SizedBox(height: 20,),
                                  CustomElevatedButton(msg: 'Add', nav: '')
                              ],
                          ),
                      ),
                      SizedBox(height:60),
                  ],
                ),
              ),
               SizedBox(height:20,
                  child:Text(
                      "VaulTrix",
                        style:TextStyle(
                          height: 2,
                          fontSize: 10,
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
