import 'home.dart';
import 'Sell.dart';
import 'setting.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _pageController = PageController();
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: [Home(), Sell(), Setting()],
      ),
      // bottomNavigationBar: GradientBottomNavigationBar(
      //   backgroundColorStart: Colors.red,
      //   backgroundColorEnd: Colors.purple,
      //   items: <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(icon: Icon(Icons.message), label: 'bet'),
      //     BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'sell'),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.mail_outline), label: 'Setting'),
      //   ],
      //   onTap: (indexx) {
      //     setState(() {
      //       index = indexx;
      //       _pageController.jumpToPage(indexx);
      //     });
      //   },
      // ),
      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 27, 106, 40),
              Color.fromARGB(255, 145, 142, 17)
            ],
            begin: Alignment.topLeft,
            end: Alignment.topRight,
            stops: [0.0, 0.8],
            tileMode: TileMode.clamp,
          ),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          selectedItemColor: Colors.white,
          currentIndex: index,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'ቤት',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'መሸጫ',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'አስተካክል',
            ),
          ],
          onTap: (indexx) {
            setState(() {
              index = indexx;
              _pageController.jumpToPage(indexx);
            });
          },
        ),
      ),
    );
  }
}
