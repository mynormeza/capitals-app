import 'package:capitals_app/bloc/capital_details_bloc.dart';
import 'package:capitals_app/screens/capital_details/widgets/capital_details_background.dart';
import 'package:flutter/material.dart';

class CapitalDetailsScreen extends StatefulWidget {
  static const String routeName = '/capital-details';

  @override
  _CapitalDetailsScreenState createState() => _CapitalDetailsScreenState();
}

class _CapitalDetailsScreenState extends State<CapitalDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final CapitalDetailsBloc capitalDetailsBloc = CapitalDetailsBloc(
      capital: ModalRoute.of(context).settings.arguments,
    );
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          CapitalDetailsBackground(
            imageUrl: capitalDetailsBloc.capital.imageUrl,
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 100,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                  child: Text(
                    capitalDetailsBloc.capital.name,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.14),
                  child: FittedBox(
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.location_city,
                          color: Colors.white,
                          size: 15,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Capital de ${capitalDetailsBloc.capital.country}',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 160,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    "LIKES",
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Text(
                        capitalDetailsBloc.capital.likes.toString(),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8),
                        child: GestureDetector(
                          onTap: () async {
                            var isSaved =
                                await capitalDetailsBloc.incrementLike();
                            if (isSaved) {
                              setState(() {
                                capitalDetailsBloc.capital.likes++;
                              });
                            }
                          },
                          child: Icon(
                            Icons.thumb_up,
                            size: 50,
                          ),
                        )),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: capitalDetailsBloc.capital.details,
                        style: TextStyle(color: Colors.black87),
                      ),
                    ]),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
