import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../Elements/QuickAccessTile.dart';
import '../Elements/SettingsDrawer.dart';


class QuickAccessList extends StatelessWidget {
  final Map<String,Color> currentTheme;
  const QuickAccessList({super.key, required this.currentTheme});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child:Scaffold(
           appBar:AppBar(
            backgroundColor:this.currentTheme["InnerContainerColor"],
            foregroundColor:this.currentTheme["VaultrixColor"],
          ),
          drawer: SettingsDrawer(currentTheme:this.currentTheme),
          body:SizedBox(
            height: 780,
            width: 470,
            child:Container(
              color: this.currentTheme['OuterContainerColor'],
              child: Column(
                children:<Widget>[
                  Container(
                    height: 670,
                    width: 410,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                        bottomLeft:Radius.circular(20),
                        bottomRight:Radius.circular(20),
                      ),
                    ),
                    color: this.currentTheme['InnerContainerColor'],
                  ),
                  child:Column(
                    children: <Widget>[
                      SizedBox(height: 40,),
                      SizedBox(
                        height: 50,
                        child: Row(
                          children: <Widget>[
                            SizedBox(width: 320,),
                            ElevatedButton(
                                onPressed: (){
                                  Navigator.pop(context);
                                },
                                child: Text("Back")
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30,),
                      SizedBox(height: 20,),

                      //Todo
                      QuickAccessTile(currentTheme: this.currentTheme, ContactName: "Dhivya", ContactNum: '8248701899', ContactRelation: 'Friend',),
                      SizedBox(height: 20,),
                      QuickAccessTile(currentTheme: this.currentTheme, ContactName: "Sadhish", ContactNum: '9344944110', ContactRelation: 'Dad',),
                      SizedBox(height: 30,),

                      Container(
                          height: 300,
                          width: 370,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white,),
                              borderRadius: BorderRadius.circular(20),
                              color: this.currentTheme['HelperBgColor'],
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
                                          color: this.currentTheme['VaultrixColor'],
                                        ),
                                    ),
                                  ),
                                  SizedBox(height: 30,),
                                  QuickAccessFields(currentTheme: this.currentTheme, hintText: 'Contact Name'),
                                  SizedBox(height: 10,),
                                  QuickAccessFields(currentTheme: this.currentTheme, hintText: 'Contact Number'),
                                  SizedBox(height: 10,),
                                  QuickAccessFields(currentTheme: this.currentTheme, hintText: 'Contact Relation'),
                                  SizedBox(height: 20,),
                                  ElevatedButton(
                                      onPressed: (){},
                                      child: Text("Add"),
                                  ),
                              ],
                          ),
                      ),
                  ],
                ),
              ),
               SizedBox(height:20,
                  child:Text(
                      "VaulTrix",
                        style:TextStyle(
                          height: 2,
                          fontSize: 10,
                          color: this.currentTheme['VaultrixColor']
                        ),
                  ),
                ),
              ],
            ),
          ),
          ),
        ),
    );
  }
}
