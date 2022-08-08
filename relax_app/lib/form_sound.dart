import 'dart:ffi';

import 'package:app_relaxante/database/dao/sound_dao.dart';
import 'package:app_relaxante/models/sound.dart';
import 'package:app_relaxante/theme.dart';
import 'package:flutter/material.dart';

class FormSound extends StatelessWidget{
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();
  final TextEditingController _audioController = TextEditingController();

  final SoundDao dao = SoundDao();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: mainBackground,),
      body:
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Text('Cadastro de  Audio'),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: 'Nome do audio'
                ),
              ),
              TextField(
                controller: _descriptionController,
                maxLength: 50,
                decoration: InputDecoration(
                    hintText: 'Descrição do audio'
                ),
              ),
              TextField(
                controller: _imageController,
                decoration: InputDecoration(
                    hintText: 'Link da imagem'
                ),
              ),
              TextField(
                controller: _audioController,
                decoration: InputDecoration(
                    hintText: 'Link do audio'
                ),
              ),
              TextButton(
                child: Text('Salvar', style: TextStyle(color: mainBackground)),
                onPressed: () {
                  final String name = _nameController.text;
                  final String description = _descriptionController.text;
                  final String image = _imageController.text;
                  final String audio = _audioController.text;
                  final int favourite = 0;
                  final saveAudio = Sound(0, name, description, image, audio, favourite);
                  if(saveAudio != null){
                    dao.save(saveAudio).then((id) => Navigator.pop(context));
                  }
                },
              )
            ],
          ),
        ),
    );
  }
}