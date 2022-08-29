import 'package:app_relaxante/theme.dart';
import 'package:flutter/material.dart';

class AddedToFavourites extends StatefulWidget {
  @override
  State<AddedToFavourites> createState() => _AddedToFavouritesState();
}

class _AddedToFavouritesState extends State<AddedToFavourites> {
  double _size = 0;
  double ?_updateBox() {
    setState(() {
        _size = 4;
    });
  }

  @override
  void initState(){
    super.initState();
    Future.delayed(Duration.zero).then((value){
      _updateBox();
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Align(
      alignment: Alignment.center,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.8),
            borderRadius: BorderRadius.all(Radius.circular(25))
        ),
        height: 220,
        width: 220,
        child: Padding(
          padding: const EdgeInsets.only(right:25, left: 25, top:0, bottom:25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom:40.0),
                child: Text('Added to My Cards', textAlign: TextAlign.center,
                    style: TextStyle(color: offWhite,fontSize: 30)
                ),
              ),
              AnimatedScale(
                scale: _size,
                duration: Duration(seconds: 1),
                curve: Curves.bounceOut,
                child: Icon(
                    Icons.favorite,
                    color: offWhite,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
