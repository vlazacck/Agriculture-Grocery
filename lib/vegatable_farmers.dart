import 'package:flutter/material.dart';

class vegatable_farmers extends StatefulWidget {
  const vegatable_farmers({Key? key}) : super(key: key);

  @override
  State<vegatable_farmers> createState() => _vegatable_farmersState();
}

class _vegatable_farmersState extends State<vegatable_farmers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("vegatable farm"),
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, index) {
            return SizedBox(
              height: 100.0,
              child: Card(
                elevation: 2,
                child: ListTile(
                  title: Text("Abebe"),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/ox.jpg'),
                    radius: 30,
                  ),
                  subtitle: new Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Text("location",
                            style: new TextStyle(
                                fontSize: 14.0, fontWeight: FontWeight.normal)),
                        new Text('Population: 200',
                            style: new TextStyle(
                                fontSize: 12.0, fontWeight: FontWeight.normal)),
                      ]),
                  trailing: Icon(Icons.phone),
                ),
              ),
            );
          }),
    );
  }
}
