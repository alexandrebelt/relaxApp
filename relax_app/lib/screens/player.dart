import 'dart:async';
import 'package:app_relaxante/database/local_storage_repository.dart';
import 'package:app_relaxante/screens/blocs/favourite_event.dart';
import 'package:app_relaxante/screens/blocs/favourite_state.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_relaxante/components/progress.dart';
import 'package:app_relaxante/database/dao/sound_dao.dart';
import 'package:app_relaxante/models/sound.dart';
import 'package:app_relaxante/screens/blocs/favourite_bloc.dart';
import 'package:app_relaxante/screens/controls/settings.dart';
import 'package:app_relaxante/screens/controls/timer/timer.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import '../theme.dart';
import 'package:audio_session/audio_session.dart';
import 'package:flutter/services.dart';

class RelaxPlayer extends StatefulWidget {
  final audioPlayer = AudioPlayer();
  final SoundDao dao = SoundDao();
  final Sound sound;
  //var isFavourite = verifav();


  RelaxPlayer(this.sound);

  @override
  State<RelaxPlayer> createState() => _RelaxPlayerState();
}

class _RelaxPlayerState extends State<RelaxPlayer> {
  var accessBox = LocalStorageRepository();
  int _counter = 0;
  Timer _timer;
  bool _timerVisible = false;
  bool isFavourite;


  void initState() {
    isFavourite = verifav();
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    ));
    _init();
  }

  Future<void> _init() async {
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.speech());
    widget.audioPlayer.playbackEventStream.listen((event) {},
        onError: (Object e, StackTrace stackTrace) {
          print('A stream error occurred: $e');
        });
    try {
      String url = widget.sound.audio;
      await widget.audioPlayer.setAudioSource(AudioSource.uri(Uri.parse(
          url)));
    } catch (e) {
      print("Error loading audio source: $e");
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      widget.audioPlayer.stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    String timeCount = formatTime(_counter);
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0, right: 20),
              child: GestureDetector(
                onTap: () {
                  widget.dao.delete(widget.sound.id);
                  Navigator.pop(context);
                  setState(() {
                  });
                },
                child: Icon(
                  Icons.settings,
                  size: 40,
                  color: iconPrimary,
                ),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(widget.sound.image),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: Colors.black26,
                  ),
                  height: 530,
                  width: 340,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BlocBuilder<FavouriteBloc, FavouriteState>(
                    builder: (context, state) {

                      print(isFavourite);
                      return IconButton(
                        icon: Icon(isFavourite
                            ? Icons.favorite_outlined
                            : Icons.favorite_outline_outlined),
                        onPressed: () {
                          final id = widget.sound.id;
                          final name = widget.sound.name;
                          final desc = widget.sound.description;
                          final image = widget.sound.image;
                          final audio = widget.sound.audio;

                          final value1 = Sound(id, name, desc, image, audio, 1);
                          final value0 = Sound(id, name, desc, image, audio, 0);

                          if(isFavourite != true){
                            setState(() {
                              isFavourite = true;
                              widget.dao.update(value1);
                            });
                              final snackBar = SnackBar(content: Text('Added to your favourites'));
                              context.read<FavouriteBloc>().add(AddFavouriteSound(widget.sound));
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          } else {
                            setState(() {
                              isFavourite = false;
                            widget.dao.update(value0);
                            context.read<FavouriteBloc>().add(RemoveFavouriteSound(widget.sound));
                            });
                            final snackBar = SnackBar(content: Text('Removed from your favourites'));
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          }
                        },
                        color: iconPrimary,
                        iconSize: 35,
                      );
                    }
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right:25.0, left: 25.0),
                    child: StreamBuilder<PlayerState>(
                      stream: widget.audioPlayer.playerStateStream,
                        builder: (context, snapshot){
                          final playerState = snapshot.data;
                          final processingState = playerState?.processingState;
                          final playing = playerState?.playing;
                          if(processingState == ProcessingState.loading ||
                          processingState == ProcessingState.buffering){
                            return IconButton(
                              onPressed: (){},
                              icon: ProgressPlayer(),
                              color: iconPrimary,
                              iconSize: 85,
                            );
                          }else if (playing != true) {
                            return IconButton(
                              icon: const Icon(Icons.play_circle),
                              color: iconPrimary,
                              iconSize: 85,
                              onPressed: (){
                                widget.audioPlayer.play();
                                widget.audioPlayer.setLoopMode(LoopMode.one);
                              }
                            );
                          } else{
                            return IconButton(
                              icon: const Icon(Icons.pause_circle),
                              color: iconPrimary,
                              iconSize: 85,
                              onPressed: widget.audioPlayer.pause,
                            );
                          }
                        }
                    ),
                  ),
                  Column(
                    children: [
                      IconButton(
                        icon: Icon(_timerVisible
                            ? Icons.timer
                            : Icons.timer_outlined),

                        onPressed: () {
                          showDialog(
                              barrierColor: iconPrimary.withOpacity(0),
                              context: context,
                              builder: (contextDialog) {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 230,
                                        width: 200,
                                        child: Material(
                                          borderRadius: BorderRadius.all(Radius.circular(25)),
                                          color: mainBackground,
                                          child: Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(bottom: 20.0),
                                                  child: Text('Timer',
                                                      style: TextStyle(
                                                        color: iconPrimary,
                                                        fontSize: 20,
                                                        fontWeight: FontWeight.bold,
                                                      )),
                                                ),
                                                OptionTimer('15 min', onTap: () => setTimer(900)),
                                                OptionTimer('30 min', onTap: () => setTimer(1800)),
                                                OptionTimer('1h', onTap: () => setTimer(3600)),
                                                OptionTimer('5h', onTap: () => setTimer(18000)),
                                                OptionTimer('Off', onTap: () => timerCancel()),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              });
                        },
                        color: iconPrimary,
                        iconSize: 35,
                      ),
                      Visibility(
                        visible: _timerVisible,
                        child: Text(timeCount,
                            style: TextStyle(
                              color: iconPrimary,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            )),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        )
    );
  }

//Verify if its a favourite
  bool verifav() {
    int boolFav = widget.sound.favourite;
    if(boolFav > 0){
      return true;
    }else{
      return false;
    }
  }

//Format time is shown in timer
  String formatTime(int _counter) {
    return '${(Duration(seconds: _counter))}'.split('.')[0].padLeft(8, '0');
  }

  //Set timer player
  setTimer(int time) {
    _counter = time;

    if (_timer != null) {
      _timer.cancel();
    }
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_counter > 0 ) {
          widget.audioPlayer.play();
          _timerVisible = true;
          _counter--;
        } else {
          _timerVisible = false;
          _timer.cancel();
          widget.audioPlayer.stop();
        }
      });
    });
    Navigator.pop(context);
  }

//Cancel timer
  timerCancel(){
    setState(() {
      _timerVisible = false;
      _timer.cancel();
    });
  }
}