import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nutrition/details.dart';

class textfield extends StatefulWidget {
  const textfield({Key? key}) : super(key: key);

  @override
  State<textfield> createState() => _textfieldState();
}

class _textfieldState extends State<textfield> {
  var product = [];
  var inputText = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(backgroundColor: Color(0xff1f1a30),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(height: 20,),


              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Color(0xff3a304d)),
                child: TextFormField(style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(suffixIcon: Icon(Icons.search_outlined,color: Colors.white,),hintText: 'Search your product',hintStyle:TextStyle(color: Colors.white),border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
                  onChanged: (val) {
                    setState(() {
                      inputText = val;
                    });
                  },
                ),
              ),
              SizedBox(height: 30,),
              Expanded(
                child: Container(
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('grocery')
                        .where('name', isGreaterThanOrEqualTo: inputText)
                        .snapshots(),
                    builder: (
                      BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot
                    ) {
                      if(snapshot.hasError){
                        return Center(child: Text("something is wrong"),);
                      }
                      if(snapshot.connectionState==ConnectionState.waiting){
                        return Center(child: CircularProgressIndicator(color: Colors.black,),);
                      }

                      return ListView(children: snapshot.data!.docs.map((DocumentSnapshot document) {


                        return GestureDetector(
                          child: Card(color: Color(0xff3a304d),
                            elevation: 5,
                            child: ListTile(
                              title: Text(document['name'],style: TextStyle(color: Colors.white),),
                              leading: Image.network(document['img']),
                            ),
                          ),onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>details(document)));},
                        );
                      }).toList(),);
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
