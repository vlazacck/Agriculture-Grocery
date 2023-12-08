import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uix/color_utils.dart';
import 'package:uix/models/product.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class Sell extends StatefulWidget {
  @override
  State<Sell> createState() => _SellState();
}

class _SellState extends State<Sell> {
  PickedFile? pickedfile;
  final storageRef = FirebaseStorage.instance.ref();

  @override
  // final CollectionReference productList =
  //     FirebaseFirestore.instance.collection("product");
  // // FirebaseFirestore.instance

  // Future getUserList() async {
  //   List itemList = [];
  //   try {
  //     await productList.get().then((QuerySnapshot) {
  //       querySnapshot.documents.foreach((element) {
  //         itemList.add(element.data);
  //       });
  //     });
  //   } catch (e) {
  //     print(e.toString());
  //     return null;
  //   }
  // }
  List itemList = [];
  Future getItem() async {
    await FirebaseFirestore.instance
        .collection('products')
        .get()
        .then((snapshot) => snapshot.docs.forEach((document) {
              print(document.reference);
              itemList.add(document.reference.id);
            }));
  }

  XFile? _image;
  late String imageTemporary;

  Future getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    this.imageTemporary = (image.path);

    setState(() {
      this._image = image;
    });
  }

  String? dropdownValue;

  final _formKey = GlobalKey<FormState>();

  TextEditingController namecontrol = TextEditingController();
  TextEditingController pricecontrol = TextEditingController();

  String pro_item_state = "የበሰለ";
  String pro_region = 'አዲስ አባባ';
  String pro_itemmm = "fruit";

  @override
  @override
  void initState() {
    getItem();
    super.initState();
  }

  final iconG = List<Color>.from([
    Color.fromARGB(255, 144, 132, 24),
    Color.fromARGB(255, 77, 126, 21),
  ]);

  List<dynamic> region = [];
  late int regionId;

  bool valuefirst = false;
  bool valueSecond = false;
  Widget build(BuildContext context) {
    resizeToAvoidBottomPadding:
    false;

    return Container(
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Center(
                child: Text('መሸጫ',
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
          body: Container(
            child: OrientationBuilder(
              builder: (context, orientation) {
                return SingleChildScrollView(
                  child: Container(
                      child: Column(
                    children: [
                      SizedBox(height: 20),
                      const ExpansionPanelList(),
                      Row(
                        children: [
                          const Text(
                            'ፎቶ ጨምር ',
                            style: TextStyle(fontSize: 29),
                          ),
                          GestureDetector(
                            onTap: () {
                              getImage();
                            },
                            child: CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.purpleAccent,
                              backgroundImage: _image == null
                                  ? null
                                  : FileImage(File(_image!.path)),
                            ),
                          ),
                          ShaderMask(
                            shaderCallback: (rect) => LinearGradient(
                              colors: iconG,
                              begin: Alignment.topCenter,
                            ).createShader(rect),
                            child: new IconButton(
                              icon: new Icon(
                                Icons.add_a_photo,
                                size: 60,
                                color: Color.fromARGB(255, 132, 174, 41),
                              ),
                              onPressed: () {
                                getImage();
                              },
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: TextField(
                              controller: namecontrol,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                icon: Icon(Icons.email),
                                hintText: 'የምትሸጥው እቃ ስም',
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 35),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: TextField(
                              controller: pricecontrol,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                icon: Icon(Icons.currency_exchange),
                                hintText: 'የእቃው  ዋጋ ',
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 35),
                      CheckboxListTile(
                        value: true,
                        onChanged: (val) {},
                        activeColor: Colors.green,
                        title: const Text('አስተያየት አለው'),
                      ),
                      SizedBox(height: 35),
                      Container(
                        width: orientation == Orientation.landscape ? 750 : 400,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 255, 255,
                                255), //background color of dropdown button
                            border: Border.all(
                                color: Color.fromARGB(95, 38, 172, 63),
                                width: 1), //border of dropdown button
                            borderRadius: BorderRadius.circular(
                                50), //border raiuds of dropdown button
                            boxShadow: <BoxShadow>[
                              //apply shadow on Dropdown button
                              BoxShadow(
                                  color: Color.fromARGB(
                                      145, 145, 175, 34), //shadow for button
                                  blurRadius: 5) //blur radius of shadow
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              hint: Text("የእቃው አይነት"),
                              value: pro_itemmm,
                              items: [
                                DropdownMenuItem(
                                  child: Text("fruit"),
                                  value: 'fruit',
                                ),
                                DropdownMenuItem(
                                  child: Text("አትክልቶችህ"),
                                  value: 'vegetabels',
                                ),
                                DropdownMenuItem(
                                  child: Text("የቤት እንስሳት"),
                                  value: 'animals',
                                ),
                                DropdownMenuItem(
                                  child: Text("የወተት ተዋፆ"),
                                  value: 'diary product',
                                ),
                                DropdownMenuItem(
                                  child: Text("ቅመማ ቅመሞች"),
                                  value: 'species',
                                ),
                                DropdownMenuItem(
                                  child: Text("ዘሮች"),
                                  value: 'seeds ',
                                ),
                              ],
                              focusColor: Color.fromARGB(255, 149, 182, 27),
                              onChanged: (value) {
                                setState(() {
                                  pro_itemmm = value.toString();
                                });
                              },
                              icon: Padding(
                                  //Icon at tail, arrow bottom is default icon
                                  padding: EdgeInsets.only(left: 255),
                                  child: Icon(Icons.arrow_circle_down_sharp,
                                      color: Colors.green)),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Container(
                        width: orientation == Orientation.landscape ? 750 : 400,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 255, 255,
                                255), //background color of dropdown button
                            border: Border.all(
                                color: Color.fromARGB(96, 52, 191, 52),
                                width: 1), //border of dropdown button
                            borderRadius: BorderRadius.circular(
                                50), //border raiuds of dropdown button
                            boxShadow: <BoxShadow>[
                              //apply shadow on Dropdown button
                              BoxShadow(
                                  color: Color.fromARGB(
                                      145, 134, 148, 39), //shadow for button
                                  blurRadius: 5) //blur radius of shadow
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              hint: Text("የት ክልል ነዎት"),
                              value: pro_region,
                              items: [
                                DropdownMenuItem(
                                  child: Text("አዲስ አባባ"),
                                  value: 'አዲስ አባባ',
                                ),
                                DropdownMenuItem(
                                  child: Text("ባህርዳር"),
                                  value: 'ባህርዳር',
                                ),
                                DropdownMenuItem(
                                  child: Text("መቀሌ"),
                                  value: 'መቀሌ',
                                ),
                                DropdownMenuItem(
                                  child: Text("ጅማ"),
                                  value: 'ጅማ',
                                ),
                                DropdownMenuItem(
                                  child: Text("ሃዋሳ"),
                                  value: 'ሃዋሳ',
                                ),
                                DropdownMenuItem(
                                  child: Text("ድሬድዋ"),
                                  value: 'ድሬድዋ',
                                ),
                              ],
                              focusColor: Colors.green,
                              onChanged: (value) {
                                setState(() {
                                  pro_region = value.toString();
                                });
                              },
                              icon: Padding(
                                  //Icon at tail, arrow bottom is default icon
                                  padding: EdgeInsets.only(left: 267),
                                  child: Icon(Icons.arrow_circle_down_sharp,
                                      color: Colors.green)),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      Container(
                        width: orientation == Orientation.landscape ? 750 : 400,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 247, 248,
                                247), //background color of dropdown button
                            border: Border.all(
                                color: Color.fromARGB(96, 47, 202, 62),
                                width: 1), //border of dropdown button
                            borderRadius: BorderRadius.circular(
                                50), //border raiuds of dropdown button
                            boxShadow: <BoxShadow>[
                              //apply shadow on Dropdown button
                              BoxShadow(
                                  color: Color.fromARGB(
                                      145, 165, 197, 34), //shadow for button
                                  blurRadius: 5) //blur radius of shadow
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              hint: Text("ያለበት ደረጃ "),
                              value: pro_item_state,
                              items: [
                                DropdownMenuItem(
                                  child: Text("የበሰለ"),
                                  value: 'የበሰለ',
                                ),
                                DropdownMenuItem(
                                  child: Text("መካከለኛ"),
                                  value: 'መካከለኛ',
                                ),
                                DropdownMenuItem(
                                  child: Text("ያልበሰለ"),
                                  value: 'ያልበሰለ',
                                ),
                              ],
                              focusColor: Color.fromARGB(255, 123, 172, 38),
                              onChanged: (value) {
                                setState(() {
                                  pro_item_state = value.toString();
                                });
                              },
                              icon: Padding(
                                  //Icon at tail, arrow bottom is default icon
                                  padding: EdgeInsets.only(left: 267),
                                  child: Icon(Icons.arrow_circle_down_sharp)),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 28),
                      Container(
                        width: orientation == Orientation.landscape ? 500 : 300,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(58),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(80),
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: <Color>[
                                    Color.fromARGB(255, 27, 106, 40),
                                    Color.fromARGB(255, 145, 142, 17),
                                  ])),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.all(0.0),
                                primary: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(80.0)),
                              ),
                              child: const Text('ፖስት'),
                              onPressed: () async {
                                // firebase_storage.Reference ref =
                                //     firebase_storage.FirebaseStorage.instance
                                //         .ref('cust-image/$namecontrol.jpg');
                                // await ref.putFile(File(_image!.path));

                                Product pro_item = Product(
                                    namecontrol.text,
                                    pricecontrol.text,
                                    imageTemporary,
                                    pro_itemmm.toString(),
                                    pro_region.toString(),
                                    pro_item_state.toString(),
                                    FirebaseAuth.instance.currentUser!.uid
                                        .toString());

                                try {
                                  File file = File(imageTemporary);
                                  FirebaseStorage storage =
                                      FirebaseStorage.instance;
                                  var ref = storage
                                      .ref()
                                      .child("productimage/${file.path}");
                                  var uploadTask = ref.putFile(file);
                                  var url = await uploadTask
                                      .then((p0) => p0.ref.getDownloadURL());

                                  FirebaseFirestore.instance
                                      .collection("product")
                                      .add({
                                    "name": pro_item.name,
                                    "price": pro_item.price,
                                    "image": url,
                                    "productitem": pro_item.product_item,
                                    "region": pro_item.region,
                                    "productstate": pro_item.product_state,
                                    "user_id": pro_item.user_id
                                  }).then((value) async {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text("product added")));
                                  });
                                } catch (e) {
                                  print('there is an eror');
                                }
                                // catchError((error) {
                                //   ScaffoldMessenger.of(context).showSnackBar(
                                //       SnackBar(content: Text(error)));
                                // });
                              }),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  )),
                );
              },
            ),
          )),
    );
  }
}
