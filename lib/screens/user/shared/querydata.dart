import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mum_k4/services/reviews.dart';

class Querydata extends StatefulWidget {
  @override
  _QuerydataState createState() => _QuerydataState();
}

class _QuerydataState extends State<Querydata> {

   bool reviewFLag = false;

  var reviews1;
  var reviews2;
  var reviews3;
@override
void initState() {
  super.initState();

  ReviewService()
  .getLatestReview('2020-05-12')
  .then((QuerySnapshot docs) {
    if(docs.documents.isNotEmpty){
      reviewFLag = true;
      reviews1 = docs.documents[0].data;
      reviews2 = docs.documents[1].data;
      // reviews3 = docs.documents[2].data;
    }
  });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("this is death"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Material(
            elevation: 7.0,
            borderRadius: BorderRadius.circular(7.0),
                    child: Container(
                      height: 300.0,
                      padding:EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Reviews', style: TextStyle(fontSize: 17.0),),
                SizedBox(height: 10.0,),
                Container(height: 0.5,
                width: double.infinity,
                color: Colors.red,),
                SizedBox(height: 15.0,),
                Text('Latest Reviews',
                style: TextStyle(fontSize: 14.0),),
                SizedBox(height: 45.0,),
                Row(children: <Widget>[
                  // reviewFLag ?
                  Row(
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 50.0,
                            width: 50.0,
                            child: RaisedButton(
                              child: Text("Click me to get info"),
                              onPressed: (){
                                print(reviews1);
                                // print(reviews2);
                                // print(reviews3);
                              },),
                            )
                        ],
                        )
                  ],)
                  ],),
              ],
            ),
                    ),
          ),
        ),
      ),
    );
  }
}
