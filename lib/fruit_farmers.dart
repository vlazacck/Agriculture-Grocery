import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:uix/readData/get_products.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:url_launcher/url_launcher.dart';

class fruit_farmer extends StatefulWidget {
  const fruit_farmer({Key? key}) : super(key: key);

  @override
  State<fruit_farmer> createState() => _fruit_farmerState();
}

Future<Widget> _getImage(BuildContext context, String imageName) async {
  Image image;
  return await FireStorageService.loadImage(context, imageName).then((value) {
    return image = Image.network(
      value.toString(),
      fit: BoxFit.scaleDown,
    );
  });
}

class _fruit_farmerState extends State<fruit_farmer> {
  late Stream<QuerySnapshot> _streampro;
  @override
  void initState() {
    super.initState();
    _streampro = _refProduct.snapshots();
  }

  Future<String> getData(String id) async {
    final ds =
        await FirebaseFirestore.instance.collection('users').doc(id).get();
    return ds['phonenumber'];
  }

  @override

  // List<String> itemList = [];
  // Future getItem() async {
  //   await FirebaseFirestore.instance
  //       .collection('products')
  //       .get()
  //       .then((snapshot) => snapshot.docs.forEach((document) {
  //             print(document.reference);
  //             itemList.add(document.reference.id);
  //           }));
  // }

  final Stream<QuerySnapshot> products =
      FirebaseFirestore.instance.collection('products').snapshots();
  final Stream<QuerySnapshot> users =
      FirebaseFirestore.instance.collection('users').snapshots();

  var aa = 'google.com';
  CollectionReference _refProduct =
      FirebaseFirestore.instance.collection('product');
  CollectionReference _refusers =
      FirebaseFirestore.instance.collection('users');

  _launchCaller(String id) async {
    String url = "tel:${getData(id)}";
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    _refProduct.get();
    _refProduct.snapshots();
    _refusers.snapshots();
    return Scaffold(
      appBar: AppBar(
        title: Text("fruit farm"),
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
      body: Container(
        child: StreamBuilder<QuerySnapshot>(
            stream: _streampro,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                {
                  return Center(child: CircularProgressIndicator());
                }
              }

              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (BuildContext context, index) {
                    return SizedBox(
                      height: 150.0,
                      child: Card(
                        elevation: 2,
                        child: ListTile(
                          title: Text(
                            snapshot.data?.docs[index]['name'],
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                                snapshot.data?.docs[index]['image']),
                            radius: 40,
                          ),
                          // ignore: unnecessary_new
                          subtitle: new Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  (Icons.add_location_outlined),
                                ),
                                // ignore: unnecessary_new
                                Text(
                                  snapshot.data?.docs[index]['price'],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  snapshot.data?.docs[index]['region'],
                                ),

                                SizedBox(
                                  height: 5,
                                ),

                                Text(
                                  snapshot.data?.docs[index]['productitem'],
                                  style: TextStyle(fontSize: 24),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                              ]),
                          trailing: IconButton(
                            onPressed: () {
                              _launchCaller(
                                  snapshot.data!.docs[index]['user_id']);
                            },
                            icon: Icon(
                              Icons.phone,
                              size: 50,
                            ),
                          ),
                        ),
                      ),
                    );
                  });
            }),
      ),
      // body: Expanded(
      //   child: FutureBuilder(
      //     future: getItem(),
      //     builder: (context, snapshot) {
      //       return ListView.builder(
      //           itemCount: itemList.length,
      //           itemBuilder: (BuildContext context, index) {
      //             return SizedBox(
      //               height: 150.0,
      //               child: Card(
      //                 elevation: 2,
      //                 child: ListTile(
      //                   title: GetPro(documemtId: itemList[index]),
      //                   leading: CircleAvatar(
      //                     backgroundImage: const AssetImage('assets/fruit.jpg'),
      //                     radius: 40,
      //                   ),
      //                   // ignore: unnecessary_new
      //                   subtitle: new Column(
      //                       mainAxisAlignment: MainAxisAlignment.start,
      //                       crossAxisAlignment: CrossAxisAlignment.start,
      //                       children: <Widget>[
      //                         Icon(
      //                           (Icons.add_location_outlined),
      //                         ),
      //                         // ignore: unnecessary_new
      //                         GetPro(documemtId: itemList[index]),
      //                         new Text('quantity',
      //                             style: new TextStyle(
      //                                 fontSize: 14.0,
      //                                 fontWeight: FontWeight.normal)),
      //                         new Text('description'),
      //                         new Text('price and negoation')
      //                       ]),
      //                   trailing: Icon(
      //                     Icons.phone,
      //                     size: 50,
      //                   ),
      //                 ),
      //               ),
      //             );
      //           });
      //     },
      //   ),
      // ),
    );
  }
}

class FireStorageService extends ChangeNotifier {
  FireStorageService();
  static Future<dynamic> loadImage(BuildContext context, String Image) async {
    return await FirebaseStorage.instance.ref().child(Image).getDownloadURL();
  }
}
