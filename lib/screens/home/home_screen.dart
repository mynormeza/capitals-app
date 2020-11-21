import 'package:capitals_app/bloc/capitals_bloc.dart';
import 'package:capitals_app/data/capital.dart';
import 'package:capitals_app/screens/home/widgets/capital_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = '/';

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

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                  itemCount: capitals != null ? capitals.length : 0,
                  itemBuilder: (context, index) {
                    return CapitalCard(
                      capital: capitals[index],
                    );
                  }),
            );
          }),
    );
  }
}
