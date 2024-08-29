import 'package:flutter/material.dart';
import 'package:scholar_chat/constant_U.dart';
import 'package:scholar_chat/models/message_model.dart';

class chatBubble extends StatelessWidget {
  const chatBubble({Key? key, required this.message}) : super(key: key);
  final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        // alignment: Alignment.centerLeft,
        //because it make the container take more width (9 places)
        padding: EdgeInsets.only(left: 16, top: 24, bottom: 24, right: 16),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        decoration: BoxDecoration(
          color: kPrimayColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(32),
            bottomRight: Radius.circular(32),
          ),
        ),
        child: Text(
          message.message,
          style: TextStyle(color: Colors.white, fontSize: 19),
        ),
      ),
    );
  }
}

class chatBubbleFriend extends StatelessWidget {
  const chatBubbleFriend({Key? key, required this.message}) : super(key: key);
  final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        // alignment: Alignment.centerLeft,
        //because it make the container take more width (9 places)
        padding: EdgeInsets.only(left: 16, top: 24, bottom: 24, right: 16),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        decoration: BoxDecoration(
          color: kSecondColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            topLeft: Radius.circular(32),
            bottomLeft: Radius.circular(32),
          ),
        ),
        child: Text(
          message.message,
          style: TextStyle(
              color: Colors.white, fontFamily: 'Lobster', fontSize: 19),
        ),
      ),
    );
  }
}
