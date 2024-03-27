import 'package:app/firebase_methods/user_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../elements/QuickAccessTile.dart';
import '../elements/SettingsDrawer.dart';
import '../colorThemes.dart';
import '../elements/CustomElevatedButton.dart';
import '../elements/CustomTextFields.dart';

class QuickAccessList extends StatelessWidget {
  final nameController = TextEditingController();
  final numController = TextEditingController();
  final relController = TextEditingController();

  QuickAccessList({super.key });

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
              child: SingleChildScrollView(
                child:Column(
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
                            SizedBox(width: MediaQuery.of(context).size.width-120,),
                            CustomElevatedButton(
                                msg: 'Back',
                                nav: 'Home',
                              controllers: [],
                            ),
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
                      Column(
                      children: [
                      for(var i in currentUser.quickAccessList!)
                        QuickAccessTile(ContactName: i.name.toString(), ContactNum: i.mobile.toString(), ContactRelation: i.relation.toString(),),
                        SizedBox(height: 20,)
                      ],
                      ),
                      /*
                      QuickAccessTile(ContactName: "Dhivya", ContactNum: '8248701899', ContactRelation: 'Friend',),
                      SizedBox(height: 20,),
                      QuickAccessTile(ContactName: "Sadhish", ContactNum: '9344944110', ContactRelation: 'Dad',),
                      SizedBox(height: 30,),
                      */
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
                                  SizedBox(height: 20,),
                                  CustomTextFields(hintText: 'Contact Name',controller: nameController,),
                                  SizedBox(height: 10,),
                                  CustomTextFields(hintText: 'Contact Number',controller: numController,),
                                  SizedBox(height: 10,),
                                  CustomTextFields(hintText: 'Contact Relation',controller: relController,),
                                  SizedBox(height: 20,),
                                  CustomElevatedButton(
                                      msg: 'Add',
                                      nav: 'QAL',
                                    controllers: [nameController,numController,relController],
                                  )
                              ],
                          ),
                      ),
                      SizedBox(height:MediaQuery.of(context).size.height-735),
                  ],
                ),
              ),
               SizedBox(height:20,
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
          ),
        ],
      ),
    );
  }
}
