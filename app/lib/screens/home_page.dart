import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class HelperMessage extends StatefulWidget {
  final String msg;
  const HelperMessage({super.key, required this.msg});
  @override
  State<HelperMessage> createState() => _HelperMessageState();
}

class _HelperMessageState extends State<HelperMessage> {
  @override
  Widget build(BuildContext context){
    return ElevatedButton(
        onPressed: (){
          print(widget.msg);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange[200],
          foregroundColor: Colors.white,
          minimumSize:Size(100,40),
          shadowColor: Colors.grey,
          splashFactory: InkRipple.splashFactory,
        ),
        child: Text(widget.msg));
  }
}



class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});
  @override
  State<HomeLayout> createState() => _HomeLayout();
}

class _HomeLayout extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                  child:Column(
                    children:<Widget>[
                      SizedBox(height: 160),
                      Center(
                        child: ElevatedButton(
                          child: const Text('HELP'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80),),
                            shadowColor: Colors.grey,
                            minimumSize:Size(150,150),
                            textStyle: TextStyle(fontSize:32, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
                            elevation: 50.0,
                            surfaceTintColor: Colors.yellow,
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
                            fillColor: Colors.orangeAccent[100],
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
                          HelperMessage(msg: "I'm in Danger"),
                          SizedBox(width: 20),
                          HelperMessage(msg: "I suspect that I'm in danger"),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:<Widget>[
                          HelperMessage(msg: "I fear walking in Dark"),
                          SizedBox(width: 20),
                          HelperMessage(msg: "I need Medical help"),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:<Widget>[
                          HelperMessage(msg: "Many men surrounded me"),
                          SizedBox(width: 20),
                          HelperMessage(msg: "Other"),
                        ],
                      )
                    ],
                  ),
                  height: 760,
                  width: 410,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),),
                    color: Colors.orange[100],
                  )
              ),
              SizedBox(height:20,child:Text("VaulTrix", style:TextStyle(height:2))
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.orange[200],
    );
  }
}
