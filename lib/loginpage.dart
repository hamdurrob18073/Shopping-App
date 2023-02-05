import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nutrition/mainpage.dart';
import 'package:nutrition/rejister.dart';

import 'glovalkey.dart';

class loginpage extends StatefulWidget {
  const loginpage({Key? key}) : super(key: key);

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  TextEditingController namcon = TextEditingController();
  TextEditingController pascon = TextEditingController();
  bool obscuretext = true;
  singin()async{
    try {
      UserCredential userCredential = await firebaseAuth.signInWithEmailAndPassword(
          email: namcon.text,
          password:pascon.text
      );
      var authCredintial = userCredential.user;
      if (authCredintial!.uid.isNotEmpty){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>mainp()));
      }
      else{
        Fluttertoast.showToast(msg: 'Something is wrong');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
       Fluttertoast.showToast(msg: 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
       Fluttertoast.showToast(msg: 'Wrong password provided for that user.');
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xfffeda08),
        body: SingleChildScrollView(
          child: Container(
            color: Color(0xff1f1a30),
            height: 800.h,
            width: 400.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Container(
                    height: 350.h,
                    width: double.maxFinite,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "Please sing in to continue",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 35.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child: Container(
                    height: 65.h,
                    width: 350.w,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(15),color: Color( 0xff3a304d)),
                    child: TextField(style: TextStyle(color: Colors.white,fontSize: 18),
                      controller: namcon,
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.white,
                          ),
                          hintText: 'Enter your email',
                          hintStyle:
                              TextStyle(color: Colors.white, fontSize: 15),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child: Container(
                    height: 65.h,
                    width: 350.w,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(15),color: Color(0xff3a304d)),
                    child: TextField(style: TextStyle(color: Colors.white,fontSize: 18),
                      obscureText: obscuretext,
                      controller: pascon,
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.white,
                          ),
                          suffixIcon: obscuretext ==true?
                          IconButton(onPressed: (){setState(() {
                            obscuretext =false;

                          });}, icon: Icon(Icons.remove_red_eye,size: 20.w,color: Colors.white,)):
                              IconButton(onPressed: (){setState(() {
                                obscuretext = true;
                              });}, icon:Icon(Icons.visibility_off,size: 20.w,color: Colors.white) ),

                          hintText: 'Enter your password',
                          hintStyle:
                              TextStyle(color: Colors.white, fontSize: 15),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 80),
                  child: GestureDetector(
                    child: Container(
                      height: 90.h,
                      width: 200.w,
                      decoration: BoxDecoration(
                          color: Color(  0xff16f4dd),
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.black, fontSize: 28),
                        ),
                      ),
                    ),onTap: (){singin();},
                  ),
                ),
                SizedBox(
                  height: 60.h,
                ),
                Container(
                  height: 30.h,
                  width: 400.w,
                  child: Row(
                    children: [
                      Container(
                        height: 30.h,
                        width: 220.w,
                        padding: EdgeInsets.only(left: 75, top: 2),
                        child: Text(
                          "Don't have an Account?",
                          style: TextStyle(color: Colors.white, fontSize: 13),
                        ),
                      ),

                      GestureDetector(
                        child: Container(
                          height: 30.h,
                          width: 140.w,
                          child: Text(
                            "Sing up",
                            style: TextStyle(color: Color(0xff16f4dd), fontSize: 18),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>rejister()));

                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
