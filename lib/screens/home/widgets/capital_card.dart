import 'package:capitals_app/data/capital.dart';
import 'package:capitals_app/screens/capital_details/capital_details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CapitalCard extends StatelessWidget {
  final Capital capital;

  CapitalCard({this.capital});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          CapitalDetailsScreen.routeName,
          arguments: capital,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(5),
                  topLeft: Radius.circular(5),
                ),
                image: DecorationImage(
                  image: NetworkImage(capital.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(child: Text(capital.name)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(capital.likes.toString()),
                  ),
                  Icon(Icons.thumb_up_alt_outlined),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
