import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../screens/QuickAccess.dart';
import '../colorThemes.dart';
import '../screens/Password.dart';
import '../screens/MyProfile.dart';
import '../screens/Features.dart';
import '../screens/Location.dart';
import '../screens/Signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import '../firebase_methods/auth_service.dart';

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
                if(this.DisplayText=="My Profile"){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyProfileLayout()),
                  );
                } else if(this.DisplayText=="Quick Access List"){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QuickAccessList()),
                  );
                } else if(this.DisplayText=="Features"){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FeaturesLayout()),
                  );
                } else if(this.DisplayText=="Location"){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LocationLayout()),
                  );
                } else if(this.DisplayText=="Password"){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChangePasswordLayout()),
                  );
                } else if(this.DisplayText=="Logout"){
                  final authService = Provider.of<AuthService>(context, listen: false);
                  authService.signOut();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Signin()),
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