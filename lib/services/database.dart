import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mum_k4/models/UsersList.dart';
// import 'package:flutter/cupertino.dart';
import 'package:mum_k4/models/aahnik.dart';
class DatabaseService{
  var tada;
  var prevday;
  var today;
  var prevMonth;
  var month;
  final String uid;
  final String day;
  final String searchDate;
  final String searchName;
  DatabaseService({ this.uid, this.day, this.searchDate, this.month, this.searchName });
  //collection reference
  final CollectionReference usersCollection = Firestore.instance.collection("users");
  // final CollectionReference aahnikCollection = Firestore.instance.collection("users").document().collection("aahnik");
  Future updateUserData(String name,String mandal,String post) async {
    return await usersCollection.document(uid).setData({
      'name': name,
      'post': post,
      'mandal': mandal,
    });
  }

  //aahnik list from snapshot
  List<Aahnik> _aahnikListFromSnapshot(QuerySnapshot snapshot) {
    
    return snapshot.documents.map((doc){
      return Aahnik(

        date: doc.documentID ?? 'N/A',
        aarti:doc.data['aarti'] ?? 'N/A',
        mansi: doc.data['mansi'] ?? 'N/A',
        nityap: doc.data['nityap'] ?? 'N/A',
        vanchan:doc.data['vanchan'] ?? 'N/A',
        chesta: doc.data['chesta'] ?? 'N/A',
        gharsabha: doc.data['gharsabha'] ?? 'N/A',
        // sahan: doc.data['sahan'] ?? 'N/A',
        jivan: doc.data['jivan'] ?? 'N/A',
        name: doc.data['name'] ?? 'N/A',
        // percent: doc.data['percent'] ?? 'N/A',
      );
    }).toList();
  }

    //aahnik list from snapshot
  List<UsersList> _usersListFromSnapshot(QuerySnapshot snapshot) {
    
    return snapshot.documents.map((doc){
      return UsersList(
        mandal: doc.data['mandal'] ?? 'N/A',
        name:doc.data['name'] ?? 'N/A',
        post: doc.data['post'] ?? 'N/A',
      );
    }).toList();
  }

  //get aahnik stream
  Stream<List<Aahnik>> get aahnik {
    // print(uid);
    final CollectionReference aahnikCollection = Firestore.instance.collection("users").document(uid).collection("aahnik");
    return aahnikCollection.snapshots().map(_aahnikListFromSnapshot);
  }

  Future addaahnikdata(String aarti,String mansi,String nityap,String vanchan,String chesta,String gharsabha,String jivan, String today,String month, String name) async {
    print(name);
    print("name in database service");
    return await usersCollection.document(uid).collection('aahnik').document(today).setData({
      'aarti': aarti,
      'mansi': mansi,
      'nityap': nityap,
      'vanchan': vanchan,
      'chesta': chesta,
      'gharsabha': gharsabha,
      // 'sahan': sahan,
      'jivan': jivan,
      'date': today,
      'month': month,
      'name': name,
      // 'percent': percent,
    });
  }

    //aahnik data persistance
  Aahnik _aahnikDataFromSnapshot(DocumentSnapshot snapshot){
    return Aahnik(
      aarti: snapshot.data['aarti'],
      mansi: snapshot.data['mansi'],
      nityap: snapshot.data['nityap'],
      vanchan: snapshot.data['vanchan'],
      chesta: snapshot.data['chesta'],
      gharsabha: snapshot.data['gharsabha'],
      // sahan: snapshot.data['sahan'],
      jivan: snapshot.data['jivan'],
      name: snapshot.data['name'],
      // percent: snapshot.data['percent'],
      month: snapshot.data['month'],
    );
  }

  //get user doc stream
  Stream<Aahnik> get aahnikData {
    final CollectionReference aahnikCollection = Firestore.instance.collection("users").document(uid).collection("aahnik");
    return aahnikCollection.document(day).snapshots()
    .map(_aahnikDataFromSnapshot);
  }

  //User info for home page
    Future userDataReturn() async {
    return await usersCollection.document(uid).get();
    }

  //Report
    Stream<List<Aahnik>> get report {
    // print(uid);
    return Firestore.instance.collectionGroup('aahnik').where('date', isEqualTo: day).orderBy('name').snapshots().map(_aahnikListFromSnapshot);
  }
  //Monthly Report
    Stream<List<UsersList>> get monthlyReport {
    return Firestore.instance.collection('users').orderBy('name').snapshots().map(_usersListFromSnapshot);
  }
   //Report
    Stream<List<Aahnik>> get monthlyuserreport {
    // print(uid);
    return Firestore.instance.collectionGroup('aahnik').where('name', isEqualTo: searchName).where('month', isEqualTo: month).snapshots().map(_aahnikListFromSnapshot);
  }

  getdatetoday(){
          tada = new DateTime.now();
          prevday = new DateTime(tada.year, tada.month, tada.day - 1);
          if(tada.hour < 12){
            today = prevday.toString().split(" ");
            return today;
          }
          else{
            today = day.toString().split(" ");
            print(today);
            return today;
          }
  }
}