import 'package:flutter/material.dart';

class containerbutton extends StatelessWidget {
  containerbutton({
    Key? key,
    this.ontap,
    required this.text,
  });
  String? text;
  Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 50,
        width: double.infinity,
        child: Center(child: Text(text!)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
      ),
    );
  }
}
