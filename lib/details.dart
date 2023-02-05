import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:full_screen_image_null_safe/full_screen_image_null_safe.dart';
import 'package:nutrition/user%20detail.dart';

import 'controller.dart';

class details extends StatefulWidget {
  var product;
  details(this.product);


  


  @override
  State<details> createState() => _detailsState();
}

class _detailsState extends State<details> {
  Future usercart() async{
    FirebaseAuth _auth = FirebaseAuth.instance;
    var Currentuser = _auth.currentUser;
    CollectionReference userCart = FirebaseFirestore.instance.collection("User Cart Item");
    return userCart.doc(Currentuser!.email).collection("Item").doc().set({
      "Name":widget.product['name'],
      "Price":widget.product['price'],
      "Image":widget.product['img'],
    }).then((value) {Fluttertoast.showToast(msg: 'Product added to favorite');});

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Container(
          color: Color(0xff3a304d),
          height: 870.h,
          width: 500.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20)),
                    image: DecorationImage(
                        image: NetworkImage(widget.product['img']),
                        fit: BoxFit.cover)),
                height: 350.h,
                width: double.maxFinite,
              ),
              SizedBox(
                height: 25.h,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 17, right: 10),
                child:
                   Container(
                      height: 200.h,
                      width: double.maxFinite,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(height: 45.h,width: 400.w,
                            child: Row(
                              children: [
                                Container(
                                  height:45.h,width: 200.w,
                                  child: Text(
                                    'Description:',
                                    style: TextStyle(
                                        fontSize: 35,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 60,),
                                  child: GestureDetector(
                                    child: Container(height: 50.h,width: 50.w,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 5),
                                        child: Center(child: IconButton(icon: Icon(Icons.favorite_border_outlined,size: 40,color: Colors.white,),onPressed: (){usercart();},)),
                                      )
                                    ),onTap: (){usercart();},
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            widget.product['description'],
                            style: TextStyle(fontSize: 17, color: Colors.white),
                          ),
                        ],
                      )),

              ),
              SizedBox(height: 20.h),
              Padding(
                padding: const EdgeInsets.only(left: 17,bottom: 3),
                child: Container(height: 120.h,width: 220.w,child: Row(children: [
                  FullScreenWidget(
                    child: Center(
                      child: Container(
                        height: 100.h,
                        width: 100.w,
                        decoration: BoxDecoration(border: Border.all(color: Color(0xff3a304d),),image: DecorationImage(image: NetworkImage(widget.product['img1']),fit: BoxFit.cover),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20.w,),
                  FullScreenWidget(
                    child: Container(
                      height: 100.h,
                      width: 100.w,
                      decoration: BoxDecoration(border: Border.all(color: Color(0xff3a304d),),image: DecorationImage(image: NetworkImage(widget.product['img2']),fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ],),),
              ),
              Container(height: 150.h,width: 400.w,decoration:BoxDecoration(color: Color(0xff1f1a30),borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),),
              child:Row(crossAxisAlignment: CrossAxisAlignment.start,children: [
                Container(height: double.maxFinite,width: 210.w,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),child: Center(child: Text(widget.product['price'],style: TextStyle(color: Colors.white,fontSize: 35.sp),),),),
                Container(height: double.maxFinite,width: 160.w,child: Padding(
                  padding: const EdgeInsets.only(left: 13,right: 13,top: 23,bottom: 23),
                  child: GestureDetector(child: Container(decoration:BoxDecoration(color: Color(0xff16f4dd),borderRadius: BorderRadius.circular(20),border: Border.all(color: Colors.black)),child: Center(child: Text('Purchase Now',style: TextStyle(color: Colors.black,fontSize: 22.sp),),),),onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Confirm()));},),
                ),)
              ],)
                ,)

            ],
          ),
        ),
      ),
    ));
  }
}
