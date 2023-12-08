import 'vegatable_farmers.dart';
import 'package:flutter/material.dart';

import 'fruit_farmers.dart';

class vegetale extends StatefulWidget {
  const vegetale({Key? key}) : super(key: key);

  @override
  State<vegetale> createState() => _vegetaleState();
}

class _vegetaleState extends State<vegetale> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("vegatables"),
      ),
      body: ListView(
        padding: EdgeInsets.all(15),
        children: [
          Card(
              child: ListTile(
            title: Text("apple"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return vegatable_farmers();
              }));
            },
            leading: CircleAvatar(
              backgroundColor: Colors.cyan,
              backgroundImage: AssetImage('assets/ox.jpg'),
              radius: 30,
            ),
          )),
          Card(
              child: ListTile(
            title: Text("apple"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return vegatable_farmers();
              }));
            },
            leading: CircleAvatar(
              backgroundColor: Colors.cyan,
              backgroundImage: AssetImage('assets/ox.jpg'),
              radius: 30,
            ),
          )),
          Card(
              child: ListTile(
            title: Text("apple"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return vegatable_farmers();
              }));
            },
            leading: CircleAvatar(
              backgroundColor: Colors.cyan,
              backgroundImage: AssetImage('assets/ox.jpg'),
              radius: 30,
            ),
          )),
          Card(
              child: ListTile(
            title: Text("apple"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return vegatable_farmers();
              }));
            },
            leading: CircleAvatar(
              backgroundColor: Colors.cyan,
              backgroundImage: AssetImage('assets/ox.jpg'),
              radius: 30,
            ),
          )),
          Card(
              child: ListTile(
            title: Text("apple"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return vegatable_farmers();
              }));
            },
            leading: CircleAvatar(
              backgroundColor: Colors.cyan,
              backgroundImage: AssetImage('assets/ox.jpg'),
              radius: 30,
            ),
          )),
          Card(
              child: ListTile(
            title: Text("apple"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return vegatable_farmers();
              }));
            },
            leading: CircleAvatar(
              backgroundColor: Colors.cyan,
              backgroundImage: AssetImage('assets/ox.jpg'),
              radius: 30,
            ),
          )),
          Card(
              child: ListTile(
            title: Text("apple"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return vegatable_farmers();
              }));
            },
            leading: CircleAvatar(
              backgroundColor: Colors.cyan,
              backgroundImage: AssetImage('assets/ox.jpg'),
              radius: 30,
            ),
          )),
          Card(
              child: ListTile(
            title: Text("apple"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return vegatable_farmers();
              }));
            },
            leading: CircleAvatar(
              backgroundColor: Colors.cyan,
              backgroundImage: AssetImage('assets/ox.jpg'),
              radius: 30,
            ),
          )),
        ],
      ),
    );
  }
}
