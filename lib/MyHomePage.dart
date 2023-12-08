// ignore_for_file: file_n
import 'package:uix/HomeScreen.dart';
import 'package:uix/reset_password.dart';
import 'package:uix/reusable_widget.dart';
import 'package:uix/sinup.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'color_utils.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          hexStringToColor("997a00"),
          hexStringToColor("b3b300"),
          hexStringToColor("446600")
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.1, 20, 10),
            child: Column(
              children: <Widget>[
                Text("አግሪ ሱቅ",
                    style: TextStyle(
                      fontSize: 64,
                      foreground: Paint()
                        ..shader = LinearGradient(
                          colors: <Color>[
                            Color.fromARGB(255, 216, 84, 13),
                            Color.fromARGB(255, 212, 221, 38),
                            Color.fromARGB(255, 112, 199, 90)
                            //add more color here.
                          ],
                        ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 100.0)),
                    )),
                SizedBox(height: 20),
                logoWidget("assets/logo1.png"),
                const SizedBox(
                  height: 30,
                ),
                reusableTextField("መጠቀሚያ  ኢሜሎዎን ያስገቡ", Icons.person_outline,
                    false, _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("የሚስጥር ቁጥርዎን  ያስገቡ ", Icons.lock_outline,
                    true, _passwordTextController),
                const SizedBox(
                  height: 5,
                ),
                Center(child: forgetPassword(context)),
                firebaseUIButton(context, "ይግቡ", () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Center(
                            child: Visibility(
                          child: SpinKitWanderingCubes(
                            color: Colors.white,
                            size: 50.0,
                            duration: Duration(milliseconds: 300),
                          ),
                        ));
                      });

                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                    email: _emailTextController.text,
                    password: _passwordTextController.text,
                  )
                      .then((value) {
                    Navigator.of(context).pop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  }).onError((error, stackTrace) async {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Container(
                          height: 300,
                          color: Colors.transparent,
                          child: Text(
                            "ችግር አጋጥሙአል",
                            style: TextStyle(fontSize: 24),
                          )),
                      duration: Duration(milliseconds: 2900),
                    ));
                    print("Error ${error.toString()}");
                    try {
                      UserCredential userCredential = await FirebaseAuth
                          .instance
                          .signInWithEmailAndPassword(
                              email: "barry.allen@example.com",
                              password: "SuperSecretPassword!");
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        print('No user found for that email.');
                      } else if (e.code == 'wrong-password') {
                        print('Wrong password provided for that user.');
                      }
                    }
                  });
                }),
                signUpOption(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("አካውንት የለኝም", style: TextStyle(color: Colors.white70)),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => sinup()));
          },
          child: const Text(
            " ይመዝገቡ",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  Widget forgetPassword(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 35,
      alignment: Alignment.bottomRight,
      child: TextButton(
        child: const Text(
          "የሚስጥር ቁጥር ረስተዋል?",
          style: TextStyle(color: Colors.white70),
          textAlign: TextAlign.right,
        ),
        onPressed: () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => ResetPassword())),
      ),
    );
  }
}
