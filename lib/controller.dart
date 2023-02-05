import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Confirm extends StatefulWidget {
  const Confirm({Key? key}) : super(key: key);

  @override
  State<Confirm> createState() => _ConfirmState();
}

class _ConfirmState extends State<Confirm> {
  List<String> payment = ["Bkash", "Nogod", "Cash on Delivery"];
  var state = 0;
  TextEditingController _name = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _code = TextEditingController();
  TextEditingController _pament = TextEditingController();
  confirmdata() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    var currentuser = auth.currentUser;
    CollectionReference _collection =
        FirebaseFirestore.instance.collection("Confirm order");
    return _collection
        .doc(currentuser!.email)
        .set({
          "Name": _name.text,
          "Phone": _phone.text,
          "Address": _address.text,
          "Code": _code.text,
          "Payment": _pament.text,
        })
        .then((value) => Fluttertoast.showToast(msg: "Order Confirm"))
        .catchError(
            (error) => Fluttertoast.showToast(msg: "something is wrong"));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff1f1a30),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 30,
                  left: 10,
                  right: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        "Confirm your Product",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      child: Text(
                        "Give your correct imformation",
                        style: TextStyle(
                          color: Colors.white54,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    Container(
                      height: 60.h,
                      width: 400.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xff3a304d)),
                      child: TextField(
                        style: TextStyle(color: Colors.white, fontSize: 18),
                        controller: _name,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.drive_file_rename_outline),prefixIconColor: Colors.white,
                            hintText: 'Your name',
                            hintStyle: TextStyle(color: Colors.white54),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 60.h,
                      width: 400.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xff3a304d)),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                        controller: _phone,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.phone),prefixIconColor: Colors.white,
                            hintText: 'Your phone Number',
                            hintStyle: TextStyle(color: Colors.white54),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 60.h,
                      width: 400.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xff3a304d)),
                      child: TextField(
                        style: TextStyle(color: Colors.white, fontSize: 18),
                        controller: _address,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.home),prefixIconColor: Colors.white,
                            hintText: 'Your address',
                            hintStyle: TextStyle(color: Colors.white54),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 60.h,
                      width: 400.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xff3a304d)),
                      child: TextField(
                        style: TextStyle(color: Colors.white, fontSize: 18),
                        controller: _code,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.code),prefixIconColor: Colors.white,
                            hintText: 'Product Code',
                            hintStyle: TextStyle(color: Colors.white54),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 60.h,
                      width: 400.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xff3a304d)),
                      child: TextField(

                        style: TextStyle(color: Colors.white, fontSize: 18),
                        controller: _pament,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.payment),prefixIconColor: Colors.white,
                            suffixIcon: DropdownButton<String>(
                              items: payment.map((String value) {
                                return DropdownMenuItem(
                                  value: value,
                                  child: Text(value),
                                  onTap: () {
                                    setState(() {
                                      _pament.text = value;
                                    });
                                  },
                                );
                              }).toList(),
                              onChanged: (_) {
                                if (_pament.text == payment[0]) {
                                  Fluttertoast.showToast(
                                      msg:
                                          "This System is currently not available");
                                } else if (_pament.text == payment[1]) {
                                  Fluttertoast.showToast(
                                      msg:
                                          "This System is currently not available");
                                }
                                else(Fluttertoast.showToast(msg: "This system is available"));
                              },
                            ),
                            hintText: 'Payment method',
                            hintStyle: TextStyle(color: Colors.white54),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 70),
                      child: GestureDetector(
                        child: Container(
                            width: 200,
                            height: 60,
                            decoration: BoxDecoration(
                                color: Color(0xff16f4dd),
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                                child: Text(
                              "Place order",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 25),
                            ))),
                        onTap: () {
                          confirmdata();
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
