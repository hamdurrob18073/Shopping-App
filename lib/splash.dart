import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutrition/rejister.dart';

import 'loginpage.dart';

//0xfffeda08
class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
            height: 800.h,
            width: 600.w,
            child: Column(
              children: [
                SizedBox(height: 50,),
                Container(
                    height: 300.h, width: 300, child: Image.asset('image/5')),
                SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: Container(height: 320.h,width: 500.w,
                    decoration: BoxDecoration(
                        color: Color( 0xff1f1a30),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Buy Grocery',
                          style: TextStyle(color: Colors.white, fontSize: 35,fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          'Easily with us',
                          style: TextStyle(color: Colors.white, fontSize: 35,fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'This app in build for daily basis item',
                          style: TextStyle(color: Colors.white54, fontSize: 15),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'nessesary item to buy or handle',
                          style:
                              TextStyle(color: Colors.white54, fontSize: 15),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 27, left: 10),
                          child: GestureDetector(
                            child: Container(
                              height: 90.h,
                              width: 200.w,
                              decoration: BoxDecoration(
                                  color: Color(0xff16f4dd),
                                  borderRadius: BorderRadius.circular(20),border: Border.all(color: Colors.black)),
                              child: Center(
                                child: Text(
                                  "Continue",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 30),
                                ),
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => loginpage()));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
