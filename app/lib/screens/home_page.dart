import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../Elements/SettingsDrawer.dart';
import '../Elements/HelperMessage.dart';

class HomeLayout extends StatefulWidget {
  final Map<String,Color> currentTheme;
  const HomeLayout({super.key, required this.currentTheme});
  @override
  State<HomeLayout> createState() => _HomeLayout();
}

class _HomeLayout extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
          //leading: IconButton(
           //     icon:Icon(IconData(0xf36e, fontFamily: 'MaterialIcons')),
           //     onPressed:(){},),
          backgroundColor:widget.currentTheme["InnerContainerColor"],
          foregroundColor:widget.currentTheme["VaultrixColor"],
      ),
      drawer: SettingsDrawer(currentTheme:widget.currentTheme),
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                  child:Column(
                    children:<Widget>[
                      SizedBox(height: 80),
                      Center(
                        child: ElevatedButton(
                          child: const Text('HELP'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: widget.currentTheme['Button_Color'],
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
                          },
                          onLongPress: (){
                            print("Long Pressed");
                          },
                        ),
                      ),
                      SizedBox(height: 80),
                      SizedBox(
                        width: 250,
                        height: 50,
                        child:TextField(
                          decoration: InputDecoration(
                            hintText: 'Custom message',
                            filled: true,
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(50,)),
                            fillColor: widget.currentTheme['fillColor'],
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
                          HelperMessage(msg: "I'm in Danger",currentTheme:widget.currentTheme),
                          SizedBox(width: 20),
                          HelperMessage(msg: "I suspect that I'm in danger", currentTheme:widget.currentTheme),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:<Widget>[
                          HelperMessage(msg: "I fear walking in Dark", currentTheme:widget.currentTheme),
                          SizedBox(width: 20),
                          HelperMessage(msg: "I need Medical help", currentTheme:widget.currentTheme),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:<Widget>[
                          HelperMessage(msg: "Many men surrounded me", currentTheme:widget.currentTheme),
                          SizedBox(width: 20),
                          HelperMessage(msg: "Other", currentTheme:widget.currentTheme),
                        ],
                      )
                    ],
                  ),
                  height: 680,
                  width: 410,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
                      bottomLeft:Radius.circular(20),
                      bottomRight:Radius.circular(20),
                    ),),
                    color: widget.currentTheme['InnerContainerColor'],
                  )
              ),
              SizedBox(height:20,child:Text("VaulTrix", style:TextStyle(height:2,color: widget.currentTheme['VaultrixColor']))
              ),
            ],
          ),
        ),
      ),
      backgroundColor: widget.currentTheme['OuterContainerColor'],
    );
  }
}
