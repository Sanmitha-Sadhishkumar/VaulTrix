import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../Elements/SettingsDrawer.dart';
import '../colorThemes.dart';
import '../elements/CustomElevatedButton.dart';

class LocationLayout extends StatefulWidget {
  const LocationLayout({super.key});

  @override
  State<LocationLayout> createState() => _LocationLayoutState();
}

class _LocationLayoutState extends State<LocationLayout> {
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
                            SizedBox(width: MediaQuery.of(context).size.width-150,),
                            CustomElevatedButton(msg: 'Back', nav: 'Home'),
                          ],
                        ),
                      ),
                      Text(
                        "Location",
                        style:TextStyle(
                            height: 3,
                            fontSize: 30,
                            color: currentTheme['VaultrixColor']
                        ),
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
