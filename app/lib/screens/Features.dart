import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../Elements/SettingsDrawer.dart';
import '../Elements/CustomElevatedButton.dart';
import '../colorThemes.dart';
import 'package:flutter_switch/flutter_switch.dart';
import '../constants.dart';
import '../Elements/FeatureTile.dart';


class FeaturesLayout extends StatefulWidget {
  const FeaturesLayout({super.key});

  @override
  State<FeaturesLayout> createState() => _FeaturesLayoutState();
}

class _FeaturesLayoutState extends State<FeaturesLayout> {
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
                    children: [
                      SizedBox(
                        height: 50,
                        child: Row(
                          children: <Widget>[
                            SizedBox(width: 300,),
                            CustomElevatedButton(msg: 'Back', nav: 'Home'),
                          ],
                        ),
                      ),
                      SizedBox(height:20),
                      Text(
                        "Features Edit",
                        style:TextStyle(
                            height: 3,
                            fontSize: 30,
                            color: currentTheme['VaultrixColor']
                        ),
                      ),
                      SizedBox(height:20),
                      FeatureTile(msg: 'Location Control', status: LocationStatus,),
                      SizedBox(height:20),
                      FeatureTile(msg: 'Cry Detection', status: CryStatus,),
                      SizedBox(height:20),
                      FeatureTile(msg: 'Shriek Detection', status: ShriekStatus,),
                      SizedBox(height:20),
                      FeatureTile(msg: 'Light Detection', status: LightStatus,),
                      SizedBox(height:20),
                      FeatureTile(msg: 'Radius Calculation', status: RadiusStatus,),
                      SizedBox(height:120),
                    ],
                  ),
                ),

                SizedBox(
                  height:20,
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
