import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../elements/SettingsDrawer.dart';
import '../elements/CustomElevatedButton.dart';
import '../colorThemes.dart';

class ProfileTile extends StatelessWidget {
  final String Key;
  final String Value;
  const ProfileTile({super.key, required this.Key, required this.Value});

  double Font(){
    if(this.Key=='Email : '){
      return 13;
    } else {
      return 20;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 330,
      decoration: BoxDecoration(
        color: currentTheme['OuterContainerColor'],
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color:Colors.white),
      ),
      child:Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            this.Key,
            style: TextStyle(
              color: currentTheme['VaultrixColor'],
              fontSize: Font(),
            ),
          ),
          SizedBox(width: 20,),
          Text(
            this.Value,
            style: TextStyle(
              color: currentTheme['VaultrixColor'],
              fontSize: Font(),
            ),),
        ],
      ),
    );
  }
}

