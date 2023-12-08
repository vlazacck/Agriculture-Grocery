import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetPro extends StatelessWidget {
  final String documemtId;
  const GetPro({Key? key, required this.documemtId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference products =
        FirebaseFirestore.instance.collection('products');
    return FutureBuilder<DocumentSnapshot>(
        future: products.doc(documemtId).get(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Text('name: ${data['name']}');
          }
          return Text('Loading');
        }));
  }
}
// body: Expanded(
//         child: FutureBuilder(
//           future: getItem(),
//           builder: (BuildContext context, AsyncSnapshot snapshot) {
//             return ListView.builder(
//                 itemCount: itemList.length,
//                 itemBuilder: ((context, index) {
//                   return ListTile(
//                     title: GetPro(documemtId: getItem[index][],)
//                   );
                  
//                 }));
//           },
//         ),
//       ),
      