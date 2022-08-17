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
      'https://images.unsplash.com/photo-1525939864518-b53937989bbd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1587&q=80',
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
}