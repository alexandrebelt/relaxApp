import 'package:app_relaxante/database/dao/sound_dao.dart';
import 'package:app_relaxante/models/sound.dart';
import 'package:app_relaxante/screens/player.dart';
import 'package:app_relaxante/theme.dart';
import 'package:flutter/material.dart';

class SearchCard extends StatefulWidget{
  @override
  State<SearchCard> createState() => _SearchCardState();
}

class _SearchCardState extends State<SearchCard> {
  final TextEditingController _searchController = TextEditingController();
  final SoundDao dao = SoundDao();
  List<Sound> _sounds = List<Sound>();
  List<Sound> _soundsForDisplay = List<Sound>();

  @override
  void initState(){
    dao.findAll().then((value){
      setState(() {
        _sounds.addAll(value);
        _soundsForDisplay = _sounds;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar('Search Cards'),
      body: ListView.builder(
        itemBuilder: (context, index){
          return index == 0 ? _searchBar() : _listSounds(index-1, context);
        },
        itemCount: _soundsForDisplay.length+1,
      )
    );
  }

  _searchBar() {
    return Padding(
      padding: const EdgeInsets.only(right: 25, left: 25, top:0,  bottom: 10),
      child: TextField(
        style: TextStyle(
          color: iconPrimary,
          fontSize: 23,
        ),
            controller: _searchController,
            cursorColor: iconPrimary,
            decoration: InputDecoration(
              prefix: Padding(
                padding: const EdgeInsets.only(right:10.0 , top: 5),
                child: Icon(Icons.search, color: iconPrimary, size: 25),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: iconPrimary),
                  borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:BorderSide(color: iconPrimary.withOpacity(0.4)),
                  borderRadius: BorderRadius.all(Radius.circular(20))
              ),
            ),
        onChanged: (text){
              text = text.toLowerCase();
              setState((){
                _soundsForDisplay = _sounds.where((sound){
                  var soundTitle = sound.name.toLowerCase();
                  return soundTitle.contains(text);
                }).toList();
              });
        },
          ),
    );
  }
  _SearchCards _listSounds(int index, BuildContext context) {
    final Sound sound = _soundsForDisplay[index];
    return _SearchCards(sound, onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return RelaxPlayer(sound);
      }));
    });
  }

}

class _SearchCards extends StatelessWidget{
  final Sound sound;
  final Function onTap;
  _SearchCards(this.sound, {@required this.onTap});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListTile(
      onTap: () => onTap(),
      textColor: iconPrimary,
      leading: Image.network(sound.image),
      title: Text(sound.name.toString()),
      subtitle: Text(sound.description),
    );
  }
}
