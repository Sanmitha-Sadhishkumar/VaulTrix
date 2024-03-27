import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../elements/SettingsDrawer.dart';
import '../elements/HelperMessage.dart';
import '../colorThemes.dart';
import 'package:app/firebase_methods/auth_service.dart';
import '../firebase_methods/addData.dart';


class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});
  @override
  State<HomeLayout> createState() => _HomeLayout();
}

class _HomeLayout extends State<HomeLayout> {
  TextEditingController customTextContoller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    getInfo();
    return Scaffold(
      appBar:AppBar(
          //leading: IconButton(
           //     icon:Icon(IconData(0xf36e, fontFamily: 'MaterialIcons')),
           //     onPressed:(){},),
          backgroundColor:currentTheme["InnerContainerColor"],
          foregroundColor:currentTheme["VaultrixColor"],
      ),
      drawer: SettingsDrawer(),
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                  child:Column(
                    children:<Widget>[
                      SizedBox(height: 80, width: MediaQuery.of(context).size.width,),
                      Center(
                        child: ElevatedButton(
                          child: const Text('HELP'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: currentTheme['Button_Color'],
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80),),
                            shadowColor: Colors.grey,
                            minimumSize:Size(150,150),
                            textStyle: TextStyle(fontSize:32, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
                            elevation: 50.0,
                            //surfaceTintColor: Colors.yellow,
                            splashFactory: InkRipple.splashFactory,
                          ),
                          onPressed: (){
                            print("Pressed");
                            /*showDialog(context: context, barrierDismissible: false, builder: (BuildContext context)
                            {
                              return WillPopScope(
                                  onWillPop: () => Future.value(false),
                                  child:CustomDialog(title: 'Danger',content: 'She is in Danger'));
                            });*/
                            addAlert(message: customTextContoller.text, dangerLevel: 'suspicious');
                          },
                          onLongPress: (){
                            print("Long Pressed");
                            addAlert(message: customTextContoller.text, dangerLevel: 'strictly');
                          },
                        ),
                      ),
                      SizedBox(height: 80),
                      SizedBox(
                        width: 250,
                        height: 50,
                        child:TextField(
                          controller: customTextContoller,
                          decoration: InputDecoration(
                            hintText: 'Custom message',
                            filled: true,
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(50,)),
                            fillColor: currentTheme['fillColor'],
                          ),
                          style: TextStyle(fontSize: 16.0, height: 2.0, color: Colors.black),
                          cursorHeight: 16,
                          cursorOpacityAnimates: true,
                        ),
                      ),
                      SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:<Widget>[
                          HelperMessage(msg: "I'm in Danger", controllers: customTextContoller,),
                          SizedBox(width: 20),
                          HelperMessage(msg: "I suspect that I'm in danger", controllers: customTextContoller),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:<Widget>[
                          HelperMessage(msg: "I fear walking in Dark", controllers: customTextContoller),
                          SizedBox(width: 20),
                          HelperMessage(msg: "I need Medical help", controllers: customTextContoller),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:<Widget>[
                          HelperMessage(msg: "Many men surrounded me", controllers: customTextContoller),
                        ],
                      )
                    ],
                  ),
                  height: MediaQuery.of(context).size.height-125,
                  width: MediaQuery.of(context).size.width,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
                      bottomLeft:Radius.circular(20),
                      bottomRight:Radius.circular(20),
                    ),),
                    color: currentTheme['InnerContainerColor'],
                  )
              ),
              SizedBox(
                  //height:20,
                  child:Text(
                      "VaulTrix",
                      style:TextStyle(
                          height:2,
                          fontSize:15,
                          color: currentTheme['VaultrixColor'],
                      ),
                  )
              ),
            ],
          ),
        ),
      ),
      backgroundColor: currentTheme['OuterContainerColor'],
    );
  }
}
