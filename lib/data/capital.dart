import 'package:cloud_firestore/cloud_firestore.dart';

class Capital {
  final String name;
  final String imageUrl;
  final String country;
  final String details;
  int likes;

  Capital({
    this.name,
    this.imageUrl,
    this.likes,
    this.country,
    this.details,
  });

  static Capital fromSnapshot(QueryDocumentSnapshot doc) {
    return Capital(
      name: doc['name'],
      imageUrl: doc['imageUrl'],
      likes: doc['likes'],
      country: doc['country'],
      details: doc['details'],
    );
  }
}
