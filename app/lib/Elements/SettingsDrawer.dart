import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../screens/QuickAccess.dart';
import '../colorThemes.dart';

class SettingsTile extends StatelessWidget {
  final String DisplayText;
  final IconData DisplayIcon;
  const SettingsTile({super.key, required this.DisplayIcon, required this.DisplayText});

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
            leading: Icon(this.DisplayIcon, color:currentTheme['VaultrixColor']),
            title: Text(this.DisplayText, style:TextStyle(height:2,color: currentTheme['VaultrixColor'])),
            focusColor:currentTheme['InnerContainerColor'],
            tileColor:currentTheme['InnerContainerColor'],
            onTap: () {
              if(this.DisplayText=="Quick Access List"){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuickAccessList()),
                );
              }
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
  const SettingsDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor:currentTheme['InnerContainerColor'],
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
                    border: Border.all(color: currentTheme['VaultrixColor']!),
                    color: currentTheme['DrawerHeader'],),
                  child:Text("   S   ", style:TextStyle(
                    height:2,
                    fontSize:50,
                    color: currentTheme['InnerContainerColor'],
                  )
                ),
                ),
                Text("Settings", style:TextStyle(fontSize:24,height:2,color: currentTheme['VaultrixColor'])),
              ]
            ),
          ),//DrawerHeader
          //SizedBox(height:40),
          SettingsTile(DisplayIcon:Icons.person,DisplayText:'My Profile'),
          SizedBox(height:10),
          SettingsTile(DisplayIcon:Icons.contacts,DisplayText:'Quick Access List'),
          SizedBox(height:10),
          SettingsTile(DisplayIcon:Icons.workspace_premium,DisplayText:'Features'),
          SizedBox(height:10),
          SettingsTile(DisplayIcon:Icons.location_on,DisplayText:'Location'),
          SizedBox(height:10),
          SettingsTile(DisplayIcon:Icons.edit,DisplayText:'Password'),
          SizedBox(height:10),
          SettingsTile(DisplayIcon:Icons.logout,DisplayText:'Logout'),
        ],
      ),
    );
  }
}

