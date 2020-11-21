import 'package:capitals_app/extensions/global.dart';
import 'package:capitals_app/screens/capital_details/capital_details_screen.dart';
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
          theme: ThemeData(
            primarySwatch: Colors.orange,
            scaffoldBackgroundColor: "#E5E5E5".toColor(),
            appBarTheme: AppBarTheme(
              color: "#E5E5E5".toColor(),
              elevation: 0,
            ),
          ),
          home: showAsHome,
          routes: {
            CapitalDetailsScreen.routeName: (context) => CapitalDetailsScreen()
          },
        );
      },
    );
  }
}
