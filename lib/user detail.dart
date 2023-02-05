import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'mainpage.dart';

class userdata extends StatefulWidget {
  const userdata({Key? key}) : super(key: key);

  @override
  State<userdata> createState() => _userdataState();
}

class _userdataState extends State<userdata> {
  TextEditingController namecon = TextEditingController();
  TextEditingController phoneecon = TextEditingController();
  TextEditingController addcon = TextEditingController();
  TextEditingController educon = TextEditingController();
  TextEditingController nidcon = TextEditingController();

  senddata() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    var currentuser = auth.currentUser;

    CollectionReference _collection =
        FirebaseFirestore.instance.collection("user data");
    return _collection
        .doc(currentuser!.email)
        .set({
          "name": namecon.text,
          "phone": phoneecon.text,
          "Adrress": addcon.text,
          "Education": educon.text,
          "NId": nidcon.text
        })
        .then((value) => Navigator.push(
            context, MaterialPageRoute(builder: (context) => mainp())))
        .catchError(
            (error) => Fluttertoast.showToast(msg: "Something is wrong"));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            color: Color(0xff1f1a30),
            height: 800.h,
            width: 500.w,
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 10),
              child: Column(
                children: [
                  Container(
                    height: 140.h,
                    width: double.maxFinite,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Give your information",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 35.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Fill the from down",
                          style:
                              TextStyle(color: Colors.white, fontSize: 18.sp),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 60.h,
                    width: 350.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xff3a304d)),
                    child: TextField(style: TextStyle(color: Colors.white),
                      controller: namecon,
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                          hintText: 'Your Name',
                          hintStyle:
                              TextStyle(color: Colors.white, fontSize: 15),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    height: 60.h,
                    width: 350.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xff3a304d)),
                    child: TextField(style: TextStyle(color: Colors.white),
                      keyboardType: TextInputType.number,
                      controller: phoneecon,
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.phone,
                            color: Colors.white,
                          ),
                          hintText: 'Phone number',
                          hintStyle:
                              TextStyle(color: Colors.white, fontSize: 15),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    height: 60.h,
                    width: 350.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xff3a304d)),
                    child: TextField(style: TextStyle(color: Colors.white),
                      controller: addcon,
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.home,
                            color: Colors.white,
                          ),
                          hintText: 'Parmanent Adrress',
                          hintStyle:
                              TextStyle(color: Colors.white, fontSize: 15),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    height: 60.h,
                    width: 350.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xff3a304d)),
                    child: TextField(style: TextStyle(color: Colors.white),
                      controller: educon,
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.school,
                            color: Colors.white,
                          ),
                          hintText: 'Education(optional)',
                          hintStyle:
                              TextStyle(color: Colors.white, fontSize: 15),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    height: 60.h,
                    width: 350.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xff3a304d)),
                    child: TextField(style: TextStyle(color: Colors.white),
                      controller: nidcon,
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.numbers,
                            color: Colors.white,
                          ),
                          hintText: 'Nid number(optional)',
                          hintStyle:
                              TextStyle(color: Colors.white, fontSize: 15),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30, left: 20),
                    child: GestureDetector(
                      child: Container(
                        height: 90.h,
                        width: 200.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xff16f4dd)),
                        child: Center(
                          child: Text(
                            "Continue",
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                        ),
                      ),
                      onTap: () {
                        senddata();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
