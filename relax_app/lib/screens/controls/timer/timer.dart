import 'package:app_relaxante/theme.dart';
import 'package:flutter/material.dart';

class OptionTimer extends StatelessWidget {
  final String text;
  final Function onTap;

  OptionTimer(this.text, {required this.onTap});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
        height: 30,
        child: TextButton(
            onPressed: () => onTap(),
            child: Text(text.toString(),
                style: TextStyle(
                  color: offWhite,
                  fontWeight: FontWeight.bold,
                ))));
  }
}