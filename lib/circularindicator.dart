import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nutrition/loginpage.dart';
import 'package:nutrition/splash.dart';

import 'glovalkey.dart';
import 'mainpage.dart';

class circular extends StatefulWidget {
  const circular({Key? key}) : super(key: key);

  @override
  State<circular> createState() => _circularState();
}

class _circularState extends State<circular> {
  startTimer(){
    Timer(Duration(seconds: 2), ()async {
      if(firebaseAuth.currentUser!=null){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> mainp()));
      }
      else{Navigator.push(context, MaterialPageRoute(builder: (context)=> splash()));}
    });
  }
  @override
  void initState(){
    super.initState();
    startTimer();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor:Color(0xff1f1a30),body: Center(child: CircularProgressIndicator(color: Color(0xff16f4dd),),) ,);
  }
}
