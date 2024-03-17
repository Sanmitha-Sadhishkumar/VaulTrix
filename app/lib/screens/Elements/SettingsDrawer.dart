import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class SettingsTile extends StatelessWidget {
  final Map<String,Color> currentTheme;
  final String DisplayText;
  final IconData DisplayIcon;
  const SettingsTile({super.key, required this.DisplayIcon, required this.DisplayText, required this.currentTheme});

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
            ),
            child : ListTile(
            leading: Icon(this.DisplayIcon, color:this.currentTheme['VaultrixColor']),
            title: Text(this.DisplayText, style:TextStyle(height:2,color: this.currentTheme['VaultrixColor'])),
            focusColor:this.currentTheme['InnerContainerColor'],
            tileColor:this.currentTheme['InnerContainerColor'],
            onTap: () {
              Navigator.pop(context);
            },
            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
          ),
          width:270,
        ),
        SizedBox(width:10),
      ],
    );
  }
}

class SettingsDrawer extends StatelessWidget {
  final Map<String,Color> currentTheme;
  const SettingsDrawer({super.key, required this.currentTheme});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor:this.currentTheme['InnerContainerColor'],
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          Container(
            height: 200,
            child: Column(
              children: <Widget>[
                SizedBox(height:30),
                Container(
                  height: 100,
                  decoration:BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: this.currentTheme['VaultrixColor']!),
                    color: this.currentTheme['DrawerHeader'],),
                  child:Text("   S   ", style:TextStyle(
                    height:2,
                    fontSize:50,
                    color: this.currentTheme['InnerContainerColor'],
                  )
                ),
                ),
                Text("Settings", style:TextStyle(fontSize:24,height:2,color: this.currentTheme['VaultrixColor'])),
              ]
            )
          ),//DrawerHeader
          //SizedBox(height:40),
          SettingsTile(DisplayIcon:Icons.person,DisplayText:'My Profile',currentTheme: this.currentTheme),
          SizedBox(height:10),
          SettingsTile(DisplayIcon:Icons.contacts,DisplayText:'Quick List',currentTheme: this.currentTheme),
          SizedBox(height:10),
          SettingsTile(DisplayIcon:Icons.workspace_premium,DisplayText:'Features',currentTheme: this.currentTheme),
          SizedBox(height:10),
          SettingsTile(DisplayIcon:Icons.location_on,DisplayText:'Location',currentTheme: this.currentTheme),
          SizedBox(height:10),
          SettingsTile(DisplayIcon:Icons.edit,DisplayText:'Password',currentTheme: this.currentTheme),
          SizedBox(height:10),
          SettingsTile(DisplayIcon:Icons.logout,DisplayText:'Logout',currentTheme: this.currentTheme),
        ],
      ),
    );
  }
}

