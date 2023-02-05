import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutrition/glovalkey.dart';
import 'package:nutrition/loginpage.dart';

class Drower extends StatefulWidget {
  const Drower({Key? key}) : super(key: key);

  @override
  State<Drower> createState() => _DrowerState();
}

class _DrowerState extends State<Drower> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 500.h,
        width: 400.w,
        color: Color(0xff3a304d),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Container(
                    height: 250.h,width: double.maxFinite,
                    color: Color(0xff1f1a30),
                    child:StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection("user data")
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData)
                          return Center(
                            child: CircularProgressIndicator(
                              color: Colors.black,
                            ),
                          );
                        return ListView(


                              children: snapshot.data!.docs
                                  .map((DocumentSnapshot document) {
                                return ListTile(leading: CircleAvatar(radius: 60,),title: Text(document["name"],),subtitle:Text(FirebaseAuth.instance.currentUser!.email.toString()));


                              }).toList()
                        );
                      },
                    ),
                  ),


              SizedBox(
                height: 50,
              ),
              Container(
                child: GestureDetector(child: Text("About Us",style: TextStyle(color: Colors.white,fontSize: 15),),onTap: (){},),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                child: GestureDetector(child: Text("About pryveci",style: TextStyle(color: Colors.white,fontSize: 15),),onTap: (){},),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                child: GestureDetector(child: Text("About us",style: TextStyle(color: Colors.white,fontSize: 15),),onTap: (){},),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                child: GestureDetector(child: Text("Terms and condition",style: TextStyle(color: Colors.white,fontSize: 15),),onTap: (){},),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                child: GestureDetector(child: Text("More from us",style: TextStyle(color: Colors.white,fontSize: 15),),onTap: (){},),
              ),


              SizedBox(height: 90),
              Padding(
                padding: const EdgeInsets.only(left: 70),
                child: SizedBox(
                    height: 50,
                    width: 180,
                    child: ElevatedButton(
                      onPressed: () {
                        firebaseAuth.signOut().then((value) => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => loginpage())));
                      },
                      child: Text(
                        'Log Out',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                      style:
                          ElevatedButton.styleFrom(primary: Color(0xff16f4dd)),
                    )),
              )
            ],
          ),
        ),

    );
  }
}
