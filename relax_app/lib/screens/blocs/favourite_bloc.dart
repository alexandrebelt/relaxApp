import 'package:app_relaxante/database/local_storage_repository.dart';
import 'package:app_relaxante/models/favourites.dart';
import 'package:app_relaxante/models/sound.dart';
import 'package:app_relaxante/screens/blocs/favourite_event.dart';
import 'package:app_relaxante/screens/blocs/favourite_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState>{
  final LocalStorageRepository _localStorageRepository;
  FavouriteBloc({
    required LocalStorageRepository localStorageRepository,
}) : _localStorageRepository = localStorageRepository,
        super(FavouriteLoading());

  @override
  Stream<FavouriteState> mapEventToState(
      FavouriteEvent event,
      ) async*{
    if(event is StartFavourite){
      yield* _mapStartFavouriteToState();
    }
    else if (event is AddFavouriteSound){
      yield* _mapAddFavouriteSoundToState(event, state);
    }
    else if (event is RemoveFavouriteSound){
      yield* _mapRemoveFavouriteSoundToState(event, state);
    }
  }

  Stream<FavouriteState> _mapStartFavouriteToState() async*{
    yield FavouriteLoading();
    try{
      Box box = await _localStorageRepository.openBox();
      List<Sound> sounds = _localStorageRepository.getFavourite(box);
      await Future<void>.delayed(Duration(seconds: 1));
      emit(FavouriteLoaded(favourite: Favourite(sounds: sounds)),);
    } catch(_){}
  }

  Stream<FavouriteState> _mapAddFavouriteSoundToState(
      AddFavouriteSound event,
      FavouriteState state,
      ) async*{
    if(state is FavouriteLoaded){
      try {
        Box box = await _localStorageRepository.openBox();
        _localStorageRepository.addSoundToFavourite(box, event.sound);
        yield FavouriteLoaded(
          favourite: Favourite(sounds: List.from(state.favourite.sounds)..add(event.sound),),);
      } catch(_){}
    }
  }
  Stream<FavouriteState> _mapRemoveFavouriteSoundToState(
      RemoveFavouriteSound event,
      FavouriteState state,
      ) async*{
    if(state is FavouriteLoaded){
      try {
        Box box = await _localStorageRepository.openBox();
        _localStorageRepository.removeSoundFromFavourite(box, event.sound);
        yield FavouriteLoaded(
          favourite: Favourite(sounds: List.from(state.favourite.sounds)..remove(event.sound),),);
      } catch(_){}
    }
  }

}