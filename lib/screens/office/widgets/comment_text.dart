
import 'package:flutter/material.dart';

class CommentTextField extends StatelessWidget {
  const CommentTextField({
    Key? key,this.controller
  }) : super(key: key);
final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding:const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.black38)),
      child: TextFormField(
        maxLines: 5,
        controller: controller??TextEditingController(),
        minLines: 1,
        keyboardType: TextInputType.multiline,
        decoration:const InputDecoration(
          fillColor: Colors.white,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
