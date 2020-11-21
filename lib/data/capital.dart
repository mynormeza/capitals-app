import 'package:cloud_firestore/cloud_firestore.dart';

class Capital {
  final String name;
  final String imageUrl;

  Capital({this.name, this.imageUrl});

  static Capital fromSnapshot(QueryDocumentSnapshot doc) {
    return Capital(name: doc['name'], imageUrl: doc['imageUrl']);
  }
}
