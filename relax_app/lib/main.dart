import 'package:app_relaxante/dashboard.dart';
import 'package:app_relaxante/database/local_storage_repository.dart';
import 'package:app_relaxante/models/sound.dart';
import 'package:app_relaxante/screens/blocs/favourite_bloc.dart';
import 'package:app_relaxante/screens/blocs/favourite_event.dart';
import 'package:app_relaxante/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(SoundAdapter());
  runApp(RelaxApp());
}

class RelaxApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => FavouriteBloc(
            localStorageRepository: LocalStorageRepository(),
          )..add(StartFavourite()),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themeApp(),
        home: Scaffold(
          body: ContainerContent(),
        ),
      ),
    );
  }
}
