import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class bp3 extends StatefulWidget {
  const bp3({Key? key}) : super(key: key);

  @override
  State<bp3> createState() => _bp3State();
}

class _bp3State extends State<bp3> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        height: 800.h,
        width: 400.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 40.h,
              width: double.maxFinite,
              child: Text(
                'Your Purches history',
                style: TextStyle(color: Colors.white, fontSize: 35),
              ),
            ),
            Container(
              height: 20.h,
              width: double.maxFinite,
              child: Text(
                'hare you will have all the product you have purches',
                style: TextStyle(color: Colors.white54, fontSize: 18),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 100.h,
              width: double.maxFinite,
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("Confirm order")
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    );
                  }
                  return GridView(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1),
                    children:
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                          return GridTile(child: Column(children: [
                            Text(document['Name'],style: TextStyle(color: Colors.white,fontSize: 25),),
                            SizedBox(height: 10,),
                            Text(document['Phone'],style: TextStyle(color: Colors.white,fontSize: 20)),
                            SizedBox(height: 10,),
                            Text(document['Code'],style: TextStyle(color: Colors.white,fontSize: 20)),
                          ],));
                        }).toList()
                  );
                },
              ),
            )
          ],
        ),
      ),
    ));
  }
}
