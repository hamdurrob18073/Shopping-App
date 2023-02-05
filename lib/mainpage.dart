import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutrition/textfield.dart';

import 'bottompage1.dart';
import 'bottompage2.dart';
import 'bottompage3.dart';
import 'cart.dart';
import 'details.dart';
// background  0xff1f1a30
//batton     0xff16f4dd
//text       0xff3a304d

class mainp extends StatefulWidget {
  @override
  State<mainp> createState() => _mainpState();
}

class _mainpState extends State<mainp> {
  var _correntindex = 0;
  final pages = [bp1(), Cart(), bp3()];


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          selectedFontSize: 20,unselectedFontSize: 10,backgroundColor: Color(0xff1f1a30),selectedItemColor: Colors.white,unselectedItemColor: Colors.white54,
          currentIndex: _correntindex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  (Icons.home),
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(
                  (Icons.favorite),
                ),
                label: "Favorite"),
            BottomNavigationBarItem(
                icon: Icon(
                  (Icons.history),
                ),
                label: "Histry"),
          ],
          onTap: (index) {
            setState(() {
              _correntindex = index;
            });
          },
        ),
        body: pages[_correntindex],
      ),
    );
  }
}
