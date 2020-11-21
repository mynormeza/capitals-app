import 'package:capitals_app/bloc/capitals_bloc.dart';
import 'package:capitals_app/data/capital.dart';
import 'package:capitals_app/shared/empty.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CapitalsBloc capitalsBloc;

  @override
  void initState() {
    capitalsBloc = CapitalsBloc();
    super.initState();
  }

  @override
  void dispose() {
    capitalsBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de capitales'),
      ),
      body: StreamBuilder<List<Capital>>(
          stream: capitalsBloc.capitals,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            List<Capital> capitals;
            if (snapshot.hasData) {
              capitals = snapshot.data;
            }

            return !snapshot.hasData
                ? Empty()
                : Center(
                    child: Text('Theres data'),
                  );
          }),
    );
  }
}
