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
      appBar: AppBar(title:_searchBar()),
      body: ListView.builder(
        padding: EdgeInsets.only(right:25, left:25),
        itemBuilder: (context, index){
          return index == 0 ? Text('') : _listSounds(index-1, context);
        },
        itemCount: _soundsForDisplay.length+1,
      )
    );
  }

  _searchBar() {
    return SizedBox(
      height: 50,
      child: TextField(
        textAlignVertical: TextAlignVertical.bottom,
        style: TextStyle(
          color: iconPrimary,
          fontSize: 18,
        ),
            controller: _searchController,
            cursorColor: iconPrimary,
            decoration: InputDecoration(
              hintText: 'Search Cards',
              hintStyle: TextStyle(
                color: iconPrimary.withOpacity(0.4),
                fontSize: 18,
              ),
              enabledBorder: OutlineInputBorder(borderSide: BorderSide(
                color:iconPrimary.withOpacity(0.4)
              )),
              focusedBorder: OutlineInputBorder(borderSide: BorderSide(
                color: iconPrimary,
              )),
              prefixIcon: Icon(Icons.search, color: iconPrimary, size: 25),
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
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(10),
          child: Image.network(sound.image)),
      title: Text(sound.name.toString()),
      subtitle: Text(sound.description),
    );
  }
}
