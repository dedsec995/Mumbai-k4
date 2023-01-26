import 'package:cloud_firestore/cloud_firestore.dart';

class ReviewService {

  getLatestReview(String date) {
    return Firestore.instance.collectionGroup('aahnik').where('date', isEqualTo: date).getDocuments();
  }
}