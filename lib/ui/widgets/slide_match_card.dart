import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smash_it/constants/size_constants.dart';
import 'package:smash_it/models/match_model.dart';

class SlideMatchCard extends StatelessWidget {
  final MatchModel match;

  SlideMatchCard({
    required this.match,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Sizes.base, bottom: Sizes.base),
      child: Align(
        alignment: Alignment.topLeft,
        child: Container(
          width: MediaQuery.of(context).size.width / 1.5,
          height: MediaQuery.of(context).size.width / 2.2,
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Sizes.base)),
            elevation: 3.0,
            child: Column(
              children: [
                Text("Date"),
                Row(
                  children: [
                    Image(
                      image: AssetImage(
                          match.getCountryFlag(teamName: match.team1)),
                    ),
                    Text(match.team1),
                  ],
                ),
                Row(
                  children: [
                    Image(
                      image: AssetImage(
                          match.getCountryFlag(teamName: match.team2)),
                    ),
                    Text(match.team2),
                  ],
                ),
                Text(match.tournamentName),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
