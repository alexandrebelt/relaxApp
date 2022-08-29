import 'package:app_relaxante/database/dao/sound_dao.dart';
import 'package:app_relaxante/models/sound.dart';



void defaultSounds(){
  final SoundDao dao = SoundDao();
  dao.save(Sound(
      0,
      'Rain',
      'Rain for sleep',
      'https://images.unsplash.com/photo-1525939864518-b53937989bbd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1587&q=80',
      'https://assets.mixkit.co/sfx/preview/mixkit-intense-rain-loop-1246.mp3',
      0)
  );
  dao.save(Sound(
      0,
      'Brown Noise',
      'Brown noise for sleep',
      'https://images.unsplash.com/photo-1545132147-d037e6c54cfd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fGFpcnBsYW5lfGVufDB8fDB8fA%3D%3D&w=1000&q=80',
      'https://assets.mixkit.co/sfx/preview/mixkit-intense-rain-loop-1246.mp3',
      0)
  );
  dao.save(Sound(
      0,
      'Campfire',
      'Camp fire to relax',
      'https://images.unsplash.com/photo-1570714589705-651a5ac546ab?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=354&q=80',
      'https://d9olupt5igjta.cloudfront.net/samples/sample_files/39135/63517cdea56ac9c77032c5e84a6135c7669ddebd/mp3/_fire_crackling.mp3?1591152093',
      0)
  );
  dao.save(Sound(
      0,
      'Thunder forest',
      'Thunder is coming',
      'https://images.unsplash.com/photo-1516410529446-2c777cb7366d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1374&q=80',
      'https://www.freesoundslibrary.com/wp-content/uploads/2021/04/thunder-and-rain-sound-effect.mp3',
      0)
  );
  dao.save(Sound(
      0,
      'Cassete',
      'The cassete noise',
      'https://images.unsplash.com/photo-1494232410401-ad00d5433cfa?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
      'https://d9olupt5igjta.cloudfront.net/samples/sample_files/104726/a8781b0041c331a88601afe2179b626c7183b69e/mp3/_Cassette_Noise.mp3?',
      0)
  );
  dao.save(Sound(
      0,
      'Beach Waves',
      'Relaxing wave noises',
      'https://images.unsplash.com/photo-1506477331477-33d5d8b3dc85?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=734&q=80',
      'https://www.zapsplat.com/wp-content/uploads/2015/sound-effects-84577/zapsplat_nature_ocean_waves_gentle_sandy_beach_distant_surf_winter_australia_84765.mp3',
      0)
  );
  dao.save(Sound(
      0,
      'Vinyl',
      'Vinyl is playing but no music',
      'https://images.unsplash.com/photo-1558584673-c834fb1cc3ca?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80',
      'https://cdn.pixabay.com/download/audio/2021/08/02/audio_b5f0b4b595.mp3?filename=vinyl-hiss-5862.mp3',
      0)
  );
  dao.save(Sound(
      0,
      'Nature',
      'The nature, natural as ever',
      'https://images.unsplash.com/photo-1426604966848-d7adac402bff?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
      'https://cdn.pixabay.com/download/audio/2021/08/09/audio_1732f5639f.mp3?filename=forest-wind-and-birds-6881.mp3',
      0)
  );
}