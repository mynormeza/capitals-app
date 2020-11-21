import 'package:capitals_app/data/capital.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CapitalDetailsBloc {
  Capital capital;
  final CollectionReference capitalsCollection =
      FirebaseFirestore.instance.collection('capitals');

  CapitalDetailsBloc({this.capital});

  Future<bool> incrementLike() {
    bool savedSuccessfully = false;
    // Call the user's CollectionReference to add a new user
    return capitalsCollection
        .doc(capital.id)
        .update({'likes': FieldValue.increment(1)})
        .then((value) => savedSuccessfully = true)
        .catchError((error) => savedSuccessfully);
  }
}
