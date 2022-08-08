import 'package:app_relaxante/database/dao/sound_dao.dart';
import 'package:app_relaxante/models/sound.dart';
import 'package:app_relaxante/theme.dart';
import 'package:flutter/material.dart';

class FormUpdateSound extends StatefulWidget {
  final Sound sound;
  FormUpdateSound(this.sound);

  @override
  State<FormUpdateSound> createState() => _FormUpdateSoundState();
}

class _FormUpdateSoundState extends State<FormUpdateSound> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _imageController = TextEditingController();
  TextEditingController _audioController = TextEditingController();
  TextEditingController _favController = TextEditingController();

  final SoundDao dao = SoundDao();

  @override
  Widget build(BuildContext context) {
    var name = widget.sound.name;
    var description = widget.sound.description;
    var image = widget.sound.image;
    var audio = widget.sound.audio;
    //var favourite = widget.sound.favourite;

    setState(() {
      _nameController.text = name;
      _descriptionController.text = description;
      _imageController.text = image;
      _audioController.text = audio;
    });

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: mainBackground,
        ),
        body: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                Text('Editar card'),
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: widget.sound.name),
                ),
                TextField(
                  controller: _descriptionController,
                  maxLength: 50,
                  decoration: InputDecoration(labelText: widget.sound.description),
                ),
                TextField(
                  controller: _imageController,
                  decoration: InputDecoration(labelText: widget.sound. image),
                ),
                TextField(
                  controller: _audioController,
                  decoration: InputDecoration(labelText: widget.sound.audio),
                ),
               TextField(
                 controller: _favController,
                 decoration: InputDecoration(labelText: ' ${widget.sound.favourite}'),
               ),
                TextButton(
                  child:
                      Text('Salvar', style: TextStyle(color: mainBackground)),
                  onPressed: () {
                    final String name = _nameController.text;
                    final String description = _descriptionController.text;
                    final String image = _imageController.text;
                    final String audio = _audioController.text;
                    final int favourite = int.tryParse(_favController.text);
                    final updateSound =
                        Sound(widget.sound.id, name, description, image, audio, favourite);
                    if (updateSound != null) {
                      dao.update(updateSound).then((id) => Navigator.pop(context));
                      setState(() {
                      });
                    }
                  },
                )
              ],
            )
        )
    );
  }
}
