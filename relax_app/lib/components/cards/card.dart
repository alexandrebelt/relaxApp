import 'package:app_relaxante/models/sound.dart';
import 'package:app_relaxante/screens/form_update.dart';
import 'package:app_relaxante/theme.dart';
import 'package:flutter/material.dart';

class Cards extends StatelessWidget{
  final Sound sound;
  final Function onTap;

  Cards(this.sound, {@required this.onTap});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 540,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(sound.image),
            fit: BoxFit.cover
        ),
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),

      //ADMIN ITEM for UPDATE
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
              color: iconPrimary,
            borderRadius: BorderRadius.all(Radius.circular(100))
      ),
              child: IconButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> FormUpdateSound(sound)));
              }, icon: Icon(Icons.edit, color: mainBackground, size: 20,)),
            ),
          ),
          //------


          ListTile(
            onTap: () => onTap(),
            title: Text(sound.name),
            subtitle: Text(sound.description),
          ),
        ],
      ),
    );
  }
}