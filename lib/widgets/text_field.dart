import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final int? maxLines;
  const TextFieldWidget(
     {
    super.key,
    required TextEditingController controller, required this.hintText, this.maxLines, 
  }) : _controller = controller;

  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
       boxShadow: <BoxShadow>[
        BoxShadow(
          color: Colors.grey,
          blurRadius: 2,
          offset: Offset(0,1)
        )
       ],
        borderRadius: BorderRadius.circular(15)
      ),
      child: TextField(
        minLines: 1,
        maxLines: maxLines?? 1,
        controller: _controller,
        decoration:  InputDecoration(
          
          
          hintText: hintText,
          border: InputBorder.none
          
        ),
      ),
    );
  }
}