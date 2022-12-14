
import 'package:app_relaxante/models/sound.dart';
import 'package:app_relaxante/screens/form_update.dart';
import 'package:app_relaxante/theme.dart';
import 'package:flutter/material.dart';

class Cards extends StatelessWidget{
  final Sound sound;
  final Function onTap;

  Cards(this.sound, {required this.onTap});
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
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),

      //ADMIN ITEM for UPDATE
      child: InkWell(
        onTap: () => onTap(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                color: offWhite,
              borderRadius: BorderRadius.all(Radius.circular(100))
        ),
               // child: IconButton(onPressed: (){
               //   Navigator.of(context).push(MaterialPageRoute(builder: (context)=> FormUpdateSound(sound)));
               // }, icon: Icon(Icons.edit, color: mainBackground, size: 20,)),
              ),
            ),
            Container(
              color: Colors.black.withOpacity(0.4),
              child: ListTile(
                textColor: Colors.white,
                title: SizedBox(
                    child: Text(sound.name,style: TextStyle(
                      fontSize:  18,
                      fontWeight: FontWeight.w300))),
                subtitle: Text(sound.description, style:TextStyle(
                    fontSize: 12,
                    fontStyle: FontStyle.italic,
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}