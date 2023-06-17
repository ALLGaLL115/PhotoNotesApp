import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/blocs.dart';
import '../models/models.dart';
import '../widgets/text_field.dart';
import 'ui.dart';

class AddNotePage extends StatefulWidget {
  final File image;
  const AddNotePage({
    super.key,
    required this.image,
  });

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
        appBar: AppBar(
          title: const Text("AddNotePage"),
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          TextFieldWidget(hintText: "Login", controller: _titleController),
          TextFieldWidget(hintText: "Login", controller: _descriptionController, maxLines: 5,),
          
          GestureDetector(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => ZoomImageWidget(image: widget.image,),));
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              height: 200,
              width: 200,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                
                image: DecorationImage(image: FileImage(widget.image,), fit: BoxFit.cover)
              ),
              ),
          ),
          ElevatedButton(onPressed: () {
            if(_titleController.text.length > 2 || _descriptionController.text.length >2){
            context.read<NoteBloc>().add(AddNoteEvent(Note(_titleController.text, _descriptionController.text, widget.image)));
            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const MyHomePage(),), (route) => false);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: const Text("Title or Description is empt")));
            }
          }, child: const Text("Save note"))
        ]),
      ),
    );
  }
}

class ZoomImageWidget extends StatelessWidget {
  final File image;
  const ZoomImageWidget({
    super.key, required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Image.file(image, fit: BoxFit.fill,),
      ),
    );
  }
}

