
import 'package:app_relaxante/components/cards/card.dart';
import 'package:app_relaxante/components/progress.dart';
import 'package:app_relaxante/database/dao/sound_dao.dart';
import 'package:app_relaxante/screens/blocs/favourite_bloc.dart';
import 'package:app_relaxante/screens/blocs/favourite_state.dart';
import 'package:app_relaxante/screens/player.dart';
import 'package:app_relaxante/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteCards extends StatefulWidget{
  @override
  State<FavouriteCards> createState() => _FavouriteCardsState();
}

class _FavouriteCardsState extends State<FavouriteCards> {
  final SoundDao dao = SoundDao();

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return
    Scaffold(
      appBar: CustomAppBar('My Cards'),
      body: Padding(
        padding: const EdgeInsets.only(right:25.0, left: 25.0),
        child: BlocBuilder<FavouriteBloc, FavouriteState>(
          builder: (context, state){
            if(state is FavouriteLoading){
              return Progress();
            }
            if(state is FavouriteLoaded){
              if(state.favourite.sounds.length == 0){
                return Center(child: Text('No Cards added yet.', style:TextStyle(
                  fontSize:20,
                )));
              }
              return GridView.count(
                primary: true,
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: 0.55,
                children: List.generate(state.favourite.sounds.length, (index){
                  return Cards(state.favourite.sounds[index], onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return RelaxPlayer(state.favourite.sounds[index]);
                    }));
                  },);
                }),
              );
            }else{
              return Text('Unexpected Error');
            }
          }
        ),
      )
    );
  }
}