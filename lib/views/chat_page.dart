import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:scholar_chat/constant_U.dart';
import 'package:scholar_chat/models/message_model.dart';
import 'package:scholar_chat/widgets/chat_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatPage extends StatelessWidget {
  static String id = 'ChatPage';
  final _controller = ScrollController();

  // FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessageCollections);
  TextEditingController controller = TextEditingController();

  Widget build(BuildContext context) {
    String email = ModalRoute.of(context)!.settings.arguments as String;
    return StreamBuilder<QuerySnapshot>(
        stream: messages.orderBy(KCreatedAt, descending: true).snapshots(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            List<Message> messagesList = [];
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              messagesList.add(Message.fromJson(snapshot.data!.docs[i]));
            }
            return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      kLogo,
                      height: 50,
                    ),
                    Text(
                      'Chat',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                backgroundColor: kPrimayColor,
                centerTitle: true,
              ),
              body: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        reverse: true,
                        controller: _controller,
                        itemCount: messagesList.length,
                        itemBuilder: ((context, index) {
                          return messagesList[index].id == email
                              ? chatBubble(
                                  message: messagesList[index],
                                )
                              : chatBubbleFriend(message: messagesList[index]);
                        })),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: TextField(
                      controller: controller,
                      onSubmitted: (data) {
                        messages.add({
                          kMessage: data,
                          KCreatedAt: DateTime.now(),
                          'id': email
                        });
                        controller.clear();
                        _controller.animateTo(
                          0,
                          // _controller.position.maxScrollExtent,
                          duration: Duration(seconds: 4),
                          curve: Curves.easeIn,
                        );
                      },
                      decoration: InputDecoration(
                          hintText: 'Send Message',
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.send),
                            color: kPrimayColor,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                              color: kPrimayColor,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: kPrimayColor),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: kPrimayColor),
                          )),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Text('loading....');
          }
          //snapshot.data الرد اللى جاي ..البيانات اللى فيه هات منها الرسالة اللى مديك ال اى دى بتاعها فوق فالفيوتشر
        }));
  }
}
