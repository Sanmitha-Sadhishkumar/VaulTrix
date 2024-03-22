import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../elements/SettingsDrawer.dart';
import '../elements/HelperMessage.dart';
import '../colorThemes.dart';

class CustomDialog extends StatefulWidget {
  final String title;
  final String content;
  const CustomDialog({super.key, required this.title, required this.content});

  @override
  State<CustomDialog> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: currentTheme['Button_Color'],
      title: Row(
        mainAxisAlignment:MainAxisAlignment.center,
        children:[
          Text(
            widget.title,
            style:TextStyle(
              color:currentTheme['VaultrixColor'],
            ),
          ),
        ],
      ),
      content: Row(
        mainAxisAlignment:MainAxisAlignment.center,
        children:[
          Text(
            widget.content,
            style:TextStyle(
              color:currentTheme['VaultrixColor'],
            ),
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'OK'),
          child: Row(
            mainAxisAlignment:MainAxisAlignment.center,
            children:[
              Text(
                'OK',
                style:TextStyle(
                  color:currentTheme['VaultrixColor'],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

