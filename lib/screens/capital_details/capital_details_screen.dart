import 'package:capitals_app/data/capital.dart';
import 'package:flutter/material.dart';

class CapitalDetailsScreen extends StatelessWidget {
  static const String routeName = '/capital-details';

  @override
  Widget build(BuildContext context) {
    final Capital args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(args.name),
      ),
      body: Center(
        child: Text('Here goes deatils'),
      ),
    );
  }
}
