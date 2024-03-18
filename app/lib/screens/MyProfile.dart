import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../elements/SettingsDrawer.dart';
import '../elements/CustomElevatedButton.dart';
import '../colorThemes.dart';
import '../elements/ProfileTile.dart';

class MyProfileLayout extends StatefulWidget {
  const MyProfileLayout({super.key});

  @override
  State<MyProfileLayout> createState() => _MyProfileLayoutState();
}

class _MyProfileLayoutState extends State<MyProfileLayout> {
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
                    children:[
                      SizedBox(
                      height: 50,
                      child: Row(
                        children: <Widget>[
                          SizedBox(width: 300,),
                          CustomElevatedButton(msg: 'Back', nav: 'Home'),
                        ],
                      ),
                    ),
                    SizedBox(height:60,width:2400),
                      Container(
                        height: 100,
                        decoration:BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: currentTheme['VaultrixColor']!),
                          color: currentTheme['DrawerHeader'],),
                        child:Text("   P   ", style:TextStyle(
                          height:2,
                          fontSize:50,
                          color: currentTheme['InnerContainerColor'],
                        )
                        ),
                      ),
                    Text(
                      "My Profile",
                      style:TextStyle(
                          height: 3,
                          fontSize: 30,
                          color: currentTheme['VaultrixColor']
                      ),
                    ),
                      SizedBox(height: 30,),
                      ProfileTile(Key:'Name : ', Value: 'Sanmitha V S'),
                      SizedBox(height: 20,),
                      ProfileTile(Key:'Contact : ', Value: '93363200587'),
                      SizedBox(height: 20,),
                      ProfileTile(Key:'Email : ', Value: 'sanmithasadhishkumar@gmail.com'),
                      SizedBox(height:130),
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
