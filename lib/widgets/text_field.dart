import 'package:flutter/material.dart';

class textFormField extends StatelessWidget {
  textFormField(
      {Key? key, required this.text, this.onChange, this.obscureText = false});
  // كدا انا اديته الdefault
  String? text;
  bool? obscureText;
  Function(String)? onChange;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText!,
      validator: (data) {
        if (data!.isEmpty) {
          return 'field is required';
          //this condition use in two textfield email and password
        }
      },
      onChanged: onChange,
      decoration: InputDecoration(
          hintText: text,
          hintStyle: TextStyle(
            color: Colors.white,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          )),
    );
  }
}
