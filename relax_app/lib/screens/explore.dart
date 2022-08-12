import 'package:app_relaxante/components/cards/card.dart';
import 'package:app_relaxante/components/progress.dart';
import 'package:app_relaxante/components/cards/gridCards.dart';
import 'package:app_relaxante/database/dao/sound_dao.dart';
import 'package:app_relaxante/screens/form_sound.dart';
import 'package:app_relaxante/models/sound.dart';
import 'package:app_relaxante/screens/player.dart';
import 'package:app_relaxante/theme.dart';
import 'package:flutter/material.dart';

class ExplorePage extends StatefulWidget {
  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  final SoundDao dao = SoundDao();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right:25.0),
            child: GestureDetector(
              onTap: (){
                showDialog(
                    context: context, builder: (contextDialog){
                  return Column(
                    children: [
                      Container(
                        color: iconPrimary,
                        height: 50,
                        width: double.maxFinite,
                        child: Row(
                          children: [
                          ],
                        ),
                      ),
                    ],
                  );
                });
              },
              child: Icon(Icons.search, color: iconPrimary, size: 35),
            ),
          )
        ],
          centerTitle: false,
          title: Text(
            'Explore Cards',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 35,
            ),
          )
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: FutureBuilder(
          future: Future.delayed(Duration.zero).then(
            (value) => dao.findAll(),
          ),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                // TODO: Handle this case.
                break;
              case ConnectionState.waiting:
                return Progress();

                break;
              case ConnectionState.active:
                // TODO: Handle this case.
                break;
              case ConnectionState.done:
                final List<Sound> sounds = snapshot.data;
                return GridView.count(
                  primary: true,
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 0.55,
                  children: List.generate(sounds.length, (index) {
                    return Cards(
                      sounds[index],
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return RelaxPlayer(sounds[index]);
                        })).then((value) {
                          setState(() {});
                        });
                      },
                    );
                  }),
                );
                break;
            }
            return Center(child: CircularProgressIndicator(color: iconPrimary));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: iconPrimary,
        child: Icon(
          Icons.add,
          color: mainBackground,
        ),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormSound();
          })).then((value) {
            setState(() {});
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
