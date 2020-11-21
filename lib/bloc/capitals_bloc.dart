import 'dart:async';

import 'package:capitals_app/data/capital.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CapitalsBloc {
  List<Capital> capitalsList;
  final CollectionReference capitalsCollection =
      FirebaseFirestore.instance.collection('capitals');

  final _capitalsStreamController = StreamController<List<Capital>>.broadcast();
  CapitalsBloc() {
    _capitalsStreamController.stream.listen(returnCapitals);
  }

  Stream<List<Capital>> get capitals => _capitalsStreamController.stream;
  StreamSink<List<Capital>> get capitalsSink => _capitalsStreamController.sink;

  Future getCapitals(bool isAscOrder) async {
    List<Capital> capitals = [];
    QuerySnapshot querySnapshot = await capitalsCollection
        .orderBy('likes', descending: !isAscOrder)
        .get();
    querySnapshot.docs.forEach((doc) {
      capitals.add(Capital.fromSnapshot(doc));
    });
    capitalsList = capitals;
    capitalsSink.add(capitals);
  }

  List<Capital> returnCapitals(capitals) {
    return capitals;
  }

  void dispose() {
    _capitalsStreamController.close();
  }
}
