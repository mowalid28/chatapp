import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:scholar_chat/constant_U.dart';

class Message {
  final String message;
  final String id;
  Message(this.message, this.id);

  factory Message.fromJson(jsonData) {
    return Message(jsonData[kMessage], jsonData['id']);
  }
}
