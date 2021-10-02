import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smash_it/constants/color_constants.dart';
import 'package:smash_it/constants/size_constants.dart';
import 'package:smash_it/extentions/timestamp_ext.dart';
import 'package:smash_it/models/match_model.dart';

class SlideMatchCard extends StatelessWidget {
  final MatchModel match;

  SlideMatchCard({
    required this.match,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        width: MediaQuery.of(context).size.width / 1.5,
        child: Card(
          color: FantasyColors.SecondaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 7.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildDateRow(match.date),
              buildCountryRow(match.team1),
              buildCountryRow(match.team2),
              Text(match.tournamentName),
            ],
          ),
        ),
      ),
    );
  }
}

buildDateRow(Timestamp date) {
  return Padding(
    padding: EdgeInsets.fromLTRB(
        Spacing.base2x, Spacing.base, Spacing.base2x, Spacing.base),
    child: Text(
      date.getFormattedDate(),
      style: GoogleFonts.bebasNeue(fontSize: 14, color: Colors.white),
    ),
  );
}

buildCountryRow(String country) {
  return Row(
    children: [
      Image(
        height: 40,
        width: 60,
        image: AssetImage(MatchModel.getCountryFlag(teamName: country)),
      ),
      Text(
        country,
        style: TextStyle(color: Colors.white),
      ),
    ],
  );
}
