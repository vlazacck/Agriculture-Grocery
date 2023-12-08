import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'HomeScreen.dart';
import 'SignUp.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formkey = GlobalKey<FormState>();

  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return ("please enter your email");
        }
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("please enter a valid email");
        }
        return null;
      },
      onSaved: (Value) {},
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "ኢሜል",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );

    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordController,
      obscureText: true,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("password is required for login");
        }

        if (!regex.hasMatch(value)) {
          return ("please enter valid password(min. 6 charater)");
        }
      },
      onSaved: (Value) {
        passwordController.text = Value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "ምስጢር ቁጥር",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          signIn(emailController.text, passwordController.text);
        },
        child: Text(
          'login',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.black12, fontWeight: FontWeight.bold),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 200,
                    child: Text('Agri_shop'),
                  ),
                  SizedBox(height: 45),
                  emailField,
                  SizedBox(height: 25),
                  passwordField,
                  SizedBox(height: 35),
                  loginButton,
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("አባል አደለሁም?"),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => sinup()));
                        },
                        child: Text(
                          'sigup',
                          style: TextStyle(
                              color: Colors.redAccent,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      )),

      /* backgroundColor: Color.fromARGB(255, 143, 173, 183),
      body: Container(
        decoration: BoxDecoration(
          //background image
          color: Color(0xFF2D2F2E),
          image: DecorationImage(
            image: const AssetImage("assets/backfru11.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.35), BlendMode.dstATop),
          ),
        ),
        height: double.infinity,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32),

          // ignore: prefer_const_literals_to_create_immutables

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(35.0),
                child: Text(
                  'አግሪ ሱቅ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 48,
                      fontFamily: 'Nyala',
                      color: Color.fromARGB(255, 32, 173, 32)),
                ),
              ),

              // ignore: prefer_const_constructors
              Padding(
                padding: const EdgeInsets.all(38.0),
                child: const SizedBox(height: 20),
              ),

              const Text(
                'ወደ አካውትህ  ግባ ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Color.fromARGB(255, 235, 136, 7),
                ),
              ),

              const SizedBox(height: 80),
              // email
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(Icons.email),
                        hintText: 'ኢሜል',
                      ),
                    ),
                  ),
                ),
              ),
              // password

              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(Icons.lock),
                        labelStyle: TextStyle(color: Colors.green),
                        hintText: 'ምስጢር ቁጥር',
                      ),
                    ),
                  ),
                ),
              ),
              //sign in button
              const SizedBox(
                height: 40,
              ),

              // ignore: avoid_unnecessary_containers
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 1.0),
                child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 75),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(color: Colors.orange),
                      color: Color.fromARGB(255, 50, 162, 65),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: (TextButton(
                        onPressed: () {
                          //action
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()),
                          );
                        },
                        child: Row(
                          children: [
                            Text('          ግባ     ',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 252, 253, 252),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                )),
                            Padding(
                              padding: const EdgeInsets.only(left: 38.0),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: 20,
                                color: Colors.orange,
                              ),
                            ),
                          ],
                        )))),
              ),

              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Text('አባል አደለሁም?',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 223, 232, 223))),

                  /*GestureDetector(onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUP()),
                      );
                      const Text('Register Now',
                          style: TextStyle(
                              color: Color.fromARGB(255, 52, 178, 52),
                              fontWeight: FontWeight.bold));
                    })*/
                  TextButton(
                      onPressed: () {
                        //action
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => sinup()),
                        );
                      },
                      child: Text('ይመዝገቡ',
                          style: TextStyle(
                              color: Color.fromARGB(255, 24, 170, 36),
                              fontWeight: FontWeight.bold)))
                ],
              )
            ],
          ),
        ),
      ),
      /*drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Mikias Worku'),
              accountEmail: Text('ikeas128@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.amber,
                child: Text(
                  'M',
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_phone_rounded),
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),*/
    */
    );
  }

  void signIn(String email, String password) async {
    if (_formkey.currentState!.validate()) {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
                Fluttertoast.showToast(msg: "login successful"),
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => HomeScreen()))
              })
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }
}
