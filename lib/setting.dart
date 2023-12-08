import 'package:flutter/material.dart';
import 'package:uix/person.dart';
import 'package:uix/reset_password.dart';
import 'color_utils.dart';
import 'se.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        hexStringToColor("997a00"),
        hexStringToColor("b3b300"),
        hexStringToColor("446600")
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Center(
              child: Text('ማስተካከያ',
                  style: TextStyle(
                    fontSize: 24,
                  ))),
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
        ),
        body: SingleChildScrollView(
          child: Container(
              child: Column(
            children: [
              Card(
                color: Colors.grey[200],
                child: SizedBox(
                  height: 100.0,
                  child: InkWell(
                    splashColor: Colors.green,
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Person();
                      }));
                    },
                    child: Row(children: <Widget>[
                      Expanded(
                          child: ListTile(
                        leading: Icon(Icons.person),
                        title: Text('ግላዊ  መረጃዎች',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 23)),
                        subtitle: Text('ስልክ ቁጥር ፣ ስም ፣ ኢሜል አድራሻ'),
                        trailing: Icon(Icons.phone),
                      ))
                    ]),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Card(
                  color: Colors.grey[200],
                  child: SizedBox(
                    height: 100.0,
                    child: InkWell(
                      splashColor: Colors.green,
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ResetPassword();
                        }));
                      },
                      child: Row(children: <Widget>[
                        Expanded(
                            child: ListTile(
                          leading: Icon(Icons.lock),
                          title: Text('የሚስጥር ቁጥር  ቀይር',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 23)),
                          subtitle: Text('የሚስጥር ቁጥር  ቀይር'),
                        ))
                      ]),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Card(
                  color: Colors.grey[200],
                  child: SizedBox(
                    height: 100.0,
                    child: InkWell(
                      splashColor: Colors.green,
                      onTap: () {},
                      child: Row(children: <Widget>[
                        Expanded(
                            child: ListTile(
                          leading: Icon(Icons.star),
                          title: Text('Rate us ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 23)),
                          subtitle: Text('your  feed back help us '),
                        ))
                      ]),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Card(
                  color: Colors.grey[200],
                  child: SizedBox(
                    height: 100.0,
                    child: InkWell(
                      splashColor: Colors.green,
                      onTap: () {},
                      child: Row(children: <Widget>[
                        Expanded(
                            child: ListTile(
                          leading: Icon(Icons.info),
                          title: Text('ስለ መተግበሪያው  ይወቁ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 23)),
                          subtitle: Text('ያግኙን  ፣ ስለምንሰጣቸው አገልግሎቶች'),
                        ))
                      ]),
                    ),
                  ),
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}
