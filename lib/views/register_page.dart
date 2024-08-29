import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scholar_chat/constant_U.dart';
import 'package:scholar_chat/helper/show_snack_bar.dart';
import 'package:scholar_chat/views/chat_page.dart';
import 'package:scholar_chat/views/login_page.dart';
import 'package:scholar_chat/widgets/containerbutton.dart';
import 'package:scholar_chat/widgets/text_field.dart';

class registerPage extends StatefulWidget {
  registerPage({Key? key}) : super(key: key);

  @override
  State<registerPage> createState() => _registerPageState();
}

class _registerPageState extends State<registerPage> {
  String? email;

  String? password;

  bool isloading = false;

  GlobalKey<FormState> formstate = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        backgroundColor: kPrimayColor,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Form(
              key: formstate,
              child: ListView(
                children: [
                  SizedBox(
                    height: 75,
                  ),
                  Image.asset(
                    'assets/images/scholar.png',
                    height: 100,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Scholar Chat',
                        style: TextStyle(
                            fontFamily: 'Pacifico',
                            fontSize: 28,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 75,
                  ),
                  Row(
                    children: [
                      Text(
                        'REGISTER',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  textFormField(
                      onChange: (data) {
                        email = data;
                      },
                      text: 'Email'),
                  SizedBox(
                    height: 10,
                  ),
                  textFormField(
                      obscureText: true,
                      onChange: (data) {
                        password = data;
                      },
                      text: 'Password'),
                  SizedBox(
                    height: 20,
                  ),
                  containerbutton(
                    ontap: () async {
                      isloading = true;
                      setState(() {});
                      if (formstate.currentState!.validate()) {
                        //check if the data is ok or not
                        try {
                          var auth = FirebaseAuth.instance;
                          await registerUser(auth);
                          Navigator.pushNamed(context, ChatPage.id);
                        } on FirebaseAuthException catch (ex) {
                          if (ex.code == 'weak-password') {
                            showSnackBar(context, 'weak password');
                          } else if (ex.code == 'email-already-in-use') {
                            showSnackBar(context, 'email already in use');
                          }
                        }
                        isloading = false;
                        setState(() {});
                      } else {}
                    },
                    text: 'REGISTER',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'I already have an account ? ',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          ' Sign in',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> registerUser(FirebaseAuth auth) async {
    UserCredential user = await auth.createUserWithEmailAndPassword(
        email: email!, password: password!);
  }
}
