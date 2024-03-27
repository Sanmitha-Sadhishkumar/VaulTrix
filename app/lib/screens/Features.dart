import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../elements/SettingsDrawer.dart';
import '../elements/CustomElevatedButton.dart';
import '../colorThemes.dart';
import 'package:flutter_switch/flutter_switch.dart';
import '../elements/FeatureTile.dart';
import 'package:app/firebase_methods/user_module.dart';

bool LocationStatus=currentUser.location;
bool CryStatus=currentUser.cry;
bool ShriekStatus=currentUser.shriek;
bool LightStatus=currentUser.light;
bool RadiusStatus=currentUser.radius;

class FeaturesLayout extends StatefulWidget {
  const FeaturesLayout({super.key});

  @override
  State<FeaturesLayout> createState() => _FeaturesLayoutState();
}

class _FeaturesLayoutState extends State<FeaturesLayout> {
  @override
  Widget build(BuildContext context) {
    print(LocationStatus);
    return Scaffold(
      appBar:AppBar(
        backgroundColor:currentTheme["InnerContainerColor"],
        foregroundColor:currentTheme["VaultrixColor"],
      ),
      drawer: SettingsDrawer(),
      body:Column(
        children: <Widget>[
          Flexible(
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
                            SizedBox(width: MediaQuery.of(context).size.width-120,),
                            CustomElevatedButton(msg: 'Back', nav: 'Home',controllers: [],),
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
                      SizedBox(height:MediaQuery.of(context).size.height-680),
                    ],
                  ),
                ),
                SizedBox(
                  height:20,
                  child:Text(
                    "VaulTrix",
                    style:TextStyle(
                        height: 2,
                        fontSize: 14,
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
