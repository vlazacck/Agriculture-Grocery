import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uix/models/product.dart';

class sello extends StatefulWidget {
  sello({Key? key}) : super(key: key);

  @override
  State<sello> createState() => _selloState();
}

class _selloState extends State<sello> {
  File? _image;
  Future getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final imageTemporary = File(image.path);

    setState(() {
      this._image = imageTemporary;
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
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("መሸጫ"),
          backgroundColor: Colors.green,
        ),
        body: OrientationBuilder(
          builder: (context, orientation) {
            return Container(
              child: Column(children: [
                SizedBox(
                  height: 20,
                ),
                Text('ፎቶ  ጨምር'),
                IconButton(
                  icon: Icon(Icons.add_a_photo_rounded),
                  onPressed: () {
                    getImage();
                  },
                )
              ]),
            );
          },
        ));
  }
}
