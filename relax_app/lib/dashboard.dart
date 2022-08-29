import 'package:app_relaxante/screens/favourites.dart';
import 'package:app_relaxante/screens/explore.dart';
import 'package:app_relaxante/screens/settings.dart';
import 'package:app_relaxante/theme.dart';
import 'package:flutter/material.dart';

const String _favourites = 'My cards';
const String _explore = 'Explore';
const String _config = 'Settings';

class ContainerContent extends StatefulWidget{
  @override
  State<ContainerContent> createState() => _ContainerContentState();
}

class _ContainerContentState extends State<ContainerContent> {
  int _index = 1;
  final List<Widget> _screens = [
    FavouriteCards(),
    ExplorePage(),
    Settings(),
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: _screens[_index],
      bottomNavigationBar: BottomNavigationBar(

        currentIndex: _index,
        onTap: tabTap,
        elevation: 0,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.favorite_outline,), label: _favourites),
          BottomNavigationBarItem(icon: Icon(Icons.explore_outlined,), label: _explore),
          BottomNavigationBarItem(icon: Icon(Icons.settings_rounded,), label: _config),
        ]
      ),
    );
  }
  void tabTap(int index){
    setState((){
      _index = index;
    });
  }
}

class BottomPage extends StatelessWidget{
  final String text;
  BottomPage(this.text);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(text);
  }
}
