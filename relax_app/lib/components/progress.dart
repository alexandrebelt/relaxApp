import 'package:app_relaxante/theme.dart';
import 'package:flutter/material.dart';

class Progress extends StatelessWidget {
  String message;

  Progress({@required this.message = 'Loading'});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(color: iconPrimary),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(message, style: TextStyle(color: iconPrimary)),
          ),
        ],
      ),
    );
  }
}

class ProgressPlayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 73,
              height: 73,
              decoration: BoxDecoration(
            color: iconPrimary,
                  borderRadius: BorderRadius.all(Radius.circular(100))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircularProgressIndicator(color: mainBackground),
                ],
              )
          ),
        ],
      ),
    );
  }
}
