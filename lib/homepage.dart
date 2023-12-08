import 'package:flutter/material.dart';
//import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

// ignore: import_of_legacy_library_into_null_safe
//import 'package:gradient_bottom_navigation_bar/gradient_bottom_navigation_bar.dart';

//import 'color_utils.dart';
import 'home.dart';
import 'Sell.dart';
import 'setting.dart';

class homepage extends StatefulWidget {
  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  Widget _createBottomNavigationBar() {
    return Container(
      // height: 110,
      // decoration: BoxDecoration(
      //   gradient: LinearGradient(
      //     colors: [Color(0xFF00D0E1), Color(0xFF00B3FA)],
      //     begin: Alignment.topLeft,
      //     end: Alignment.topRight,
      //     stops: [0.0, 0.8],
      //     tileMode: TileMode.clamp,
      //   ),
      // ),
      child: Stack(children: [
        //make sure to set extendBody: true; in the scaffold
        BottomNavigationBar(
          currentIndex: 0,
          onTap: (indexx) {
            setState(() {
              index = indexx;
              _pageController.jumpToPage(indexx);
            });
          },
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          unselectedItemColor: Colors.white,
          selectedIconTheme: IconThemeData(color: Colors.white),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Sell'),
            BottomNavigationBarItem(icon: Icon(Icons.school), label: "Profile"),
          ],
        ),
      ]),
    );
  }

  final PageController _pageController = PageController();
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: [Home(), Sell(), Setting()],
      ),
      bottomNavigationBar: _createBottomNavigationBar(),

      // GradientBottomNavigationBar(
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
    );
  }
}
