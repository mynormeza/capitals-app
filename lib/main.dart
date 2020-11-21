import 'package:capitals_app/screens/home/home_screen.dart';
import 'package:capitals_app/shared/error.dart';
import 'package:capitals_app/shared/loading.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        Widget showAsHome;
        if (snapshot.hasError) {
          showAsHome = Error();
        } else if (snapshot.connectionState == ConnectionState.done) {
          showAsHome = HomeScreen();
        } else {
          showAsHome = Loading();
        }

        return MaterialApp(
          home: showAsHome,
        );
      },
    );
  }
}
