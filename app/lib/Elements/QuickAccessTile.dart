import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../colorThemes.dart';

class QuickAccessTile extends StatefulWidget {
  final String ContactName;
  final String ContactNum;
  final String ContactRelation;
  const QuickAccessTile({super.key, required this.ContactName, required this.ContactNum, required this.ContactRelation});

  @override
  State<QuickAccessTile> createState() => _QuickAccessTileState();
}

class _QuickAccessTileState extends State<QuickAccessTile> with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
      crossAxisAlignment: CrossAxisAlignment.center,
      children:<Widget>[
        SizedBox(width:10),
        SizedBox(
          child:Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(20),
              color: currentTheme['HelperBgColor'],
            ),
            child : Container(
              height: 50,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(width: 20,),
                    Icon(Icons.contacts, color:currentTheme['VaultrixColor']),
                    SizedBox(width: 20,),
                    Text(this.widget.ContactName,
                      style:TextStyle(
                        height:1,
                        fontSize: 20,
                        color: currentTheme['VaultrixColor'],
                      ),
                    ),
                    SizedBox(width: 20,),
                    ElevatedButton(
                      onPressed: (){},
                      child: Icon(
                        Icons.arrow_drop_down,
                        color:currentTheme['VaultrixColor'],
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: currentTheme['HelperBgColor'],
                      ),
                    ),
                  ]
              ),
            ),
          ),
          width:270,
        ),
        SizedBox(width:10),
      ],
    );
  }
}