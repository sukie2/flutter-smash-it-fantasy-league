import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smash_it/constants/color_constants.dart';
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
      padding: const EdgeInsets.only(right: Spacing.baseHalf),
      child: Align(
        alignment: Alignment.topLeft,
        child: Container(
          color: Colors.red,
          padding: EdgeInsets.all(0),
          width: MediaQuery.of(context).size.width / 1.5,
          height: MediaQuery.of(context).size.width / 2.2,
          child: Card(
            color: FantasyColors.SecondaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Spacing.base)),
            elevation: 7.0,
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
