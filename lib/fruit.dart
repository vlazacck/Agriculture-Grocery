import 'fruit_farmers.dart';
import 'setting.dart';
import 'package:flutter/material.dart';

class Fruits extends StatefulWidget {
  const Fruits({Key? key}) : super(key: key);

  @override
  State<Fruits> createState() => _fruitsState();
}

class _fruitsState extends State<Fruits> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: <Color>[
                Color.fromARGB(255, 27, 106, 40),
                Color.fromARGB(255, 145, 142, 17),
              ])),
        ),
        title: Text("ፍራፍሬዎች"),
      ),
      body: ListView(
        padding: EdgeInsets.all(15),
        children: [
          Card(
              child: ListTile(
            title: Text("apple"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return fruit_farmer();
              }));
            },
            leading: CircleAvatar(
              backgroundColor: Colors.cyan,
              backgroundImage: AssetImage('assets/fruit.jpg'),
              radius: 30,
            ),
          )),
          Card(
              child: ListTile(
            title: Text("apple"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return fruit_farmer();
              }));
            },
            leading: CircleAvatar(
              backgroundColor: Colors.cyan,
              backgroundImage: AssetImage('assets/fruit.jpg'),
              radius: 30,
            ),
          )),
          Card(
              child: ListTile(
            title: Text("apple"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return fruit_farmer();
              }));
            },
            leading: CircleAvatar(
              backgroundColor: Colors.cyan,
              backgroundImage: AssetImage('assets/fruit.jpg'),
              radius: 30,
            ),
          )),
          Card(
              child: ListTile(
            title: Text("apple"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return fruit_farmer();
              }));
            },
            leading: CircleAvatar(
              backgroundColor: Colors.cyan,
              backgroundImage: AssetImage('assets/fruit.jpg'),
              radius: 30,
            ),
          )),
          Card(
              child: ListTile(
            title: Text("apple"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return fruit_farmer();
              }));
            },
            leading: CircleAvatar(
              backgroundColor: Colors.cyan,
              backgroundImage: AssetImage('assets/fruit.jpg'),
              radius: 30,
            ),
          )),
          Card(
              child: ListTile(
            title: Text("apple"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return fruit_farmer();
              }));
            },
            leading: CircleAvatar(
              backgroundColor: Colors.cyan,
              backgroundImage: AssetImage('assets/fruit.jpg'),
              radius: 30,
            ),
          )),
          Card(
              child: ListTile(
            title: Text("apple"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return fruit_farmer();
              }));
            },
            leading: CircleAvatar(
              backgroundColor: Colors.cyan,
              backgroundImage: AssetImage('assets/fruit.jpg'),
              radius: 30,
            ),
          )),
          Card(
              child: ListTile(
            title: Text("apple"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return fruit_farmer();
              }));
            },
            leading: CircleAvatar(
              backgroundColor: Colors.cyan,
              backgroundImage: AssetImage('assets/fruit.jpg'),
              radius: 30,
            ),
          )),
        ],
      ),
    );
  }
}
