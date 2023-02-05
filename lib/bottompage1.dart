import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutrition/textfield.dart';

import 'cart.dart';
import 'details.dart';
import 'drower.dart';


class bp1 extends StatefulWidget {
  const bp1({Key? key}) : super(key: key);

  @override
  State<bp1> createState() => _bp1State();
}

class _bp1State extends State<bp1> {
  List product = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(child: Drower(),),
      appBar: AppBar(

        title: Text("Grocery"),
        titleTextStyle: TextStyle(
            color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color( 0xff1f1a30),

      ),
      body:
         Container(
           color: Color( 0xff3a304d),
          height: 630.h,
          width: double.maxFinite,
          child: Column(
            children: [

              Container(
                  height: 100.h,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      color: Color( 0xff1f1a30),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25))),
                  child: Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 60.h,
                          width: 330.w,
                          decoration: BoxDecoration(
                              color: Color( 0xff3a304d),
                              borderRadius: BorderRadius.circular(10)),
                          child: TextFormField(
                            readOnly: true,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.search,color: Colors.white,),
                              hintText: 'search hare....',
                              hintStyle: TextStyle(color: Colors.white),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => textfield()));
                            },
                          ),
                        ),
                      ],
                    ),
                  )),
              SizedBox(height: 20.h),
              DefaultTabController(
                  length: 3,
                  child: Container(
                    height: 505.h,
                    width: 400.w,
                    child: Column(
                      children: [
                        Container(
                          height: 30.h,
                          width: 400.w,
                          child: TabBar(
                              labelColor: Colors.white,
                              labelStyle: TextStyle(fontSize: 20),indicatorColor: Color(0xff16f4dd),
                              unselectedLabelColor: Colors.white54,
                              unselectedLabelStyle: TextStyle(fontSize: 12),
                              isScrollable: true,
                              tabs: [
                                Tab(
                                  text: "Daily need",
                                ),
                                Tab(
                                  text: "Top Product",
                                ),
                                Tab(
                                  text: "Comming soon",
                                )
                              ]),
                        ),
                        SizedBox(height: 10.h,),
                        Container(
                          height: 465.h,
                          width: 400.w,
                          child: TabBarView(
                            children: [
                              SingleChildScrollView(
                                child: Container(
                                  height: 465.h,
                                  width: 400.w,
                                  child:Container(
                                    height: 465.h,
                                    width: 400.w,
                                    child: StreamBuilder<QuerySnapshot>(
                                        stream: FirebaseFirestore.instance
                                            .collection("grocery")
                                            .snapshots(),
                                        builder: (BuildContext context,
                                            AsyncSnapshot<QuerySnapshot> snapshot) {
                                          if (!snapshot.hasData)
                                            return Center(
                                              child: CircularProgressIndicator(
                                                color: Colors.black,
                                              ),
                                            );
                                          return GridView(
                                              gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 3,
                                                  crossAxisSpacing: 2,
                                                  mainAxisSpacing: 2,
                                                  mainAxisExtent: 202),
                                              children: snapshot.data!.docs
                                                  .map((DocumentSnapshot document) {
                                                return Padding(
                                                  padding: const EdgeInsets.all(5.0),
                                                  child: GestureDetector(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>details(document)));},
                                                    child: GridTile(
                                                        child: Container(
                                                          decoration: BoxDecoration(border: Border.all(color: Color(0xff16f4dd)),
                                                            borderRadius: BorderRadius.circular(20),
                                                            color: Colors.white,
                                                          ),
                                                          height: 200.h,
                                                          width: 200.w,
                                                          child: Column(
                                                            children: [
                                                              Container(
                                                                height: 150.h,
                                                                width: 200.w,
                                                                decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(document['img'])),
                                                                    borderRadius: BorderRadius.only(
                                                                        topRight: Radius.circular(20),
                                                                        topLeft: Radius.circular(20))),

                                                              ),
                                                              Padding(
                                                                padding: const EdgeInsets.only(left: 4,right: 4),
                                                                child: Container(
                                                                  decoration: BoxDecoration(
                                                                      borderRadius: BorderRadius.only(
                                                                          bottomLeft: Radius.circular(20),
                                                                          bottomRight: Radius.circular(20))),
                                                                  height: 91.h,
                                                                  width: 200.w,
                                                                  child:Column(
                                                                    crossAxisAlignment:
                                                                    CrossAxisAlignment.start,
                                                                    children: [
                                                                      Container(
                                                                        height: 30.h,
                                                                        width: 200.w,
                                                                        child: Text(document['name'],style: TextStyle(fontSize: 22,color: Colors.black),),
                                                                      ),
                                                                      Container(
                                                                        height: 30.h,
                                                                        width: 200.w,
                                                                        child: Text(document["price"],style: TextStyle(fontSize: 15,color: Colors.black),),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        )),
                                                  ),
                                                );
                                              }).toList());
                                        }),
                                  ),
                                ),
                              ),
                              Container(
                                  height: 238.h,
                                  width: 400.w,
                                  child: Text('2st')),
                              Container(
                                  height: 238.h,
                                  width: 400.w,
                                  child: Text('3st'))
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
            ],
          ),
        ),

    );
  }
}
