import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scholar_chat/constant_U.dart';
import 'package:scholar_chat/helper/show_snack_bar.dart';
import 'package:scholar_chat/views/chat_page.dart';
import 'package:scholar_chat/views/register_page.dart';
import 'package:scholar_chat/widgets/containerbutton.dart';
import 'package:scholar_chat/widgets/text_field.dart';

class loginPage extends StatefulWidget {
  loginPage({Key? key}) : super(key: key);

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
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
                        'LOG IN',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  textFormField(
                    text: 'Email',
                    onChange: (data) {
                      email = data;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  textFormField(
                    text: 'Password',
                    obscureText: true,
                    onChange: (data) {
                      password = data;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  containerbutton(
                    text: 'LOGIN',
                    ontap: () async {
                      if (formstate.currentState!.validate()) {
                        isloading = true;
                        setState(() {});
                        //check if the data is ok or not
                        try {
                          var auth = FirebaseAuth.instance;
                          await loginuser();
                          Navigator.pushNamed(context, ChatPage.id,
                              arguments: email);
                        } on FirebaseAuthException catch (ex) {
                          if (ex.code == 'user-not-found') {
                            showSnackBar(context, 'user not found');
                          } else if (ex.code == 'wrong-password') {
                            showSnackBar(context, 'wrong password');
                          }
                        }
                        isloading = false;
                        setState(() {});
                      } else {}
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'you don\'t have an account ? ',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, 'Register');
                        },
                        child: Text(
                          ' Register',
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

  Future<void> loginuser() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}
