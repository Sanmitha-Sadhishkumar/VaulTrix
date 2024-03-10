import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VaulTrix',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HelpButton(),
    );
  }
}

class HelpButton extends StatefulWidget {
  const HelpButton({super.key});
  @override
  State<HelpButton> createState() => _HelpButton();
}

class _HelpButton extends State<HelpButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  child:Center(
                    child: ElevatedButton(
                      child: const Text('HELP'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors?.red,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80),),
                        shadowColor: Colors.grey,
                        minimumSize:Size(150,150),
                        textStyle: TextStyle(fontSize:32, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
                        elevation: 50.0,
                        surfaceTintColor: Colors.yellow,
                      ),
                      onPressed: (){
                        print("Pressed");
                      },
                      onLongPress: (){
                        print("Long Pressed");
                      },
                    ),
                  ),
                  height: 760,
                  width: 410,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),),
                    color: Colors.orange[100],
                  )
                ),
                Text("VaulTrix", style:TextStyle(height:2)
                ),
              ],
            ),
          ),
        ),
        backgroundColor: Colors.orange[200],
    );
  }
}
