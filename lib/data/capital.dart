import 'package:cloud_firestore/cloud_firestore.dart';

class Capital {
  final String name;
  final String imageUrl;
  int likes;

  Capital({
    this.name,
    this.imageUrl,
    this.likes,
  });

  static Capital fromSnapshot(QueryDocumentSnapshot doc) {
    return Capital(
      name: doc['name'],
      imageUrl: doc['imageUrl'],
      likes: doc['likes'],
    );
  }
}
