import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../Elements/SettingsDrawer.dart';
import '../Elements/CustomElevatedButton.dart';
import '../colorThemes.dart';
import 'package:flutter_switch/flutter_switch.dart';
import '../constants.dart';


class FeatureTile extends StatefulWidget {
  final String msg;
  final bool status;
  const FeatureTile({super.key, required this.msg, required this.status});

  @override
  State<FeatureTile> createState() => _FeatureTileState();
}

class _FeatureTileState extends State<FeatureTile> {
  bool _status=false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 330,
      decoration: BoxDecoration(
        border: Border.all(color:Colors.white),
        color: currentTheme['OuterContainerColor'],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width:20),
          Text(
            widget.msg,
            style: TextStyle(
              color: currentTheme['VaultrixColor'],
              fontSize: 20,
            ),
          ),
          SizedBox(width: 50),
          FlutterSwitch(
            activeColor: currentTheme['DrawerHeader']!,
            inactiveColor: currentTheme['fillColor']!,
            width: 60.0,
            height: 30.0,
            valueFontSize: 12.0,
            toggleSize: 25.0,
            value: _status,
            borderRadius: 30.0,
            showOnOff: true,
            switchBorder: Border.all(
              color: currentTheme['HelperBgColor']!,
            ),
            toggleBorder: Border.all(
              color: currentTheme['VaultrixColor']!,
            ),
            onToggle: (val) {
              setState(() {
                _status = val;
              });
            },
          ),
        ],
      ),
    );
  }
}