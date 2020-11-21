import 'package:flutter/material.dart';

class Empty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(
        child: Text('No items'),
      ),
    );
  }
}
