
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../bloc/blocs.dart';
import 'ui.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  pickImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;

    final imageTemporart = File(image.path);

    return imageTemporart;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home page"),
  
        
        
      ),
      body: Column(children: [
        
        BlocBuilder<NoteBloc, NoteState>(
          builder: (context, state) {
            final notes = state.noteList;
            return ListView.separated(
              shrinkWrap: true,
                itemBuilder: (context, index) => NoteWidget(note: notes[index],),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                itemCount: notes.length);
          },
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          File image =  await pickImage(ImageSource.camera);
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AddNotePage(
              image: image,
            ),
          ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}






