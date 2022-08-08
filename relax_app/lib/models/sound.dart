import 'package:hive/hive.dart';
part 'sound.g.dart';

@HiveType(typeId: 0)
class Sound{
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final String image;
  @HiveField(4)
  final String audio;
  @HiveField(5)
  final int favourite;

  Sound(
      this.id,
      this.name,
      this.description,
      this.image,
      this.audio,
      this.favourite,
      );
}