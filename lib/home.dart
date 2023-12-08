import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'color_utils.dart';
import 'fruit.dart';

import 'vegetable.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 44, 65, 17).withOpacity(0.12),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(child: Text('አግሪ ሱቅ')),
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
      )

      // NewGradientAppBar(
      //   automaticallyImplyLeading: false,
      //   title: Center(
      //       child: Text(
      //     "አግሪ ሱቅ",
      //     style: TextStyle(fontSize: 24),
      //   )),
      //   gradient: LinearGradient(colors: <Color>[
      //     Color.fromARGB(255, 27, 106, 40),
      //     Color.fromARGB(255, 145, 142, 17)
      //   ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      // )
      //
      ,
      body: Padding(
          padding: EdgeInsets.all(5),
          child: GridView.count(
            crossAxisCount: 2,
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Fruits();
                    }));
                  },
                  child: Griditem("fruit")),
              GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return vegetale();
                    }));
                  },
                  child: Griditem("Vegetabels")),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return vegetale();
                  }));
                },
                child: Griditem("fish"),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return vegetale();
                  }));
                },
                child: Griditem("cow"),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return vegetale();
                  }));
                },
                child: Griditem("teff"),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return vegetale();
                  }));
                },
                child: Griditem("pepper"),
              ),
              Griditem("Vegetabels"),
              Griditem("seeds"),
              Griditem("diary producs"),
              Griditem("fertilizers"),
              Griditem("agricultural machineries"),
            ],
          )),
    );
  }
}

// ignore: must_be_immutable
class Griditem extends StatelessWidget {
  String itemname;
  //String image;

  Griditem(this.itemname);
  List imgList = [
    Image.asset('backfru.jpg'),
    Image.asset('backfru1.jpg'),
    Image.asset('backfru2.jpg'),
    Image.asset('backfru3.jpg'),
    Image.asset('backfru11.jpg'),
    Image.asset('backfru1.jpg'),
    Image.asset('backfru.jpg'),
    Image.asset('backfru2.jpg'),
    Image.asset('backfru3.jpg'),
    Image.asset('backfru.jpg'),
    Image.asset('backfru11.jpg'),
    Image.asset('backfru.jpg'),
    Image.asset('fruit.jpg'),
    Image.asset('backfru.jpg'),
    Image.asset('fruit.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Padding(padding: EdgeInsets.all(5)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              child: Image.asset(
                "assets/$itemname.jpg",
                height: 100,
                width: 200,
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(14.0),
            ),
          ),
          Text(
            itemname,
            style: TextStyle(fontSize: 25),
          )
        ],
      ),
    );
  }
}
