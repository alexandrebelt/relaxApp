import 'package:app_relaxante/models/defaultSounds.dart';
import 'package:app_relaxante/theme.dart';
import 'package:flutter/material.dart';

class IntroExplore extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: iconPrimary,
      body: Align(
        alignment: Alignment.center,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom:10.0),
                child: Text(
                    'Welcome to Liminal!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: mainBackground,
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom:10.0),
                child: Text(
                    'Liminal allows you to find the best cards\n'
                    'that will help you keep your mind calm on days\n'
                    'when you just need a rest or focus to the\n'
                    'sound of something relaxing',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: mainBackground,
                    )
                ),
              ),
              ElevatedButton(
                child: Text('Start exploring now!'),
                onPressed: (){
                  defaultSounds();
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}