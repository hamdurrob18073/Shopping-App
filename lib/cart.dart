
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Cart extends StatefulWidget {
  @override
  State<Cart> createState() => _CartState();
}
class _CartState extends State<Cart> {
  



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(height: 800.h,width: 500.w,color: Color(0xff3a304d),
          child: Column(
            children: [
              Container(height: 700.h,width: double.maxFinite,
                child: StreamBuilder<QuerySnapshot>(
                    stream:FirebaseFirestore.instance
                        .collection("User Cart Item").doc(FirebaseAuth.instance.currentUser!.email).collection("Item").snapshots(),

                    builder:
                        (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {

                      if (!snapshot.hasData)
                        return Center(
                          child: CircularProgressIndicator(
                            color: Colors.black,
                          ),
                        );

                      return ListView(
                          children:
                              snapshot.data!.docs.map((DocumentSnapshot document) {
                        return Column(
                          children: [
                            ListTile(
                              leading: Image.network(document['Image']),
                              title: Text(document['Name'],style: TextStyle(color: Colors.white),),
                              subtitle: Text(document['Price'],style: TextStyle(color: Colors.white),),
                              trailing: GestureDetector(
                                child: CircleAvatar(
                                  child: Icon(Icons.remove_circle,color: Colors.white,),
                                ),
                                onTap: () {
                                  FirebaseFirestore.instance
                                      .collection('User Cart Item')
                                      .doc(FirebaseAuth.instance.currentUser!.email)
                                      .collection('Item')
                                      .doc(document.id)
                                      .delete();
                                },
                              ),
                            ),



                          ],
                        );
                      }).toList());
                    }),
              ),



            ],
          ),
        ),

      ),
    );
  }
}
