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
          shadowColor: Colors.grey,
          color: FantasyColors.SecondaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 7.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildInfoRow(match),
              buildCountryRow(match.team1),
              buildCountryRow(match.team2),
              buildDateRow(match)
            ],
          ),
        ),
      ),
    );
  }

  buildCountryRow(String country) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(Spacing.base2x, Spacing.baseHalf,
          Spacing.base2x, Spacing.baseQuarter),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image(
            height: 30,
            width: 50,
            image: AssetImage(MatchModel.getCountryFlag(teamName: country)),
            fit: BoxFit.cover,
          ),
          SizedBox(width: Spacing.baseHalf),
          Text(
            country,
            style: GoogleFonts.cabin(fontSize: 16, color: Colors.white),
          ),
        ],
      ),
    );
  }

  buildInfoRow(MatchModel match) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          Spacing.base2x, Spacing.base, Spacing.base2x, Spacing.base),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            match.tournamentName,
            style: GoogleFonts.oswald(fontSize: 18, color: Colors.white),
          ),
          Text(
            "Match ${match.matchNumber}",
            style: GoogleFonts.cabin(fontSize: 14, color: Colors.white),
          )
        ],
      ),
    );
  }

  buildDateRow(MatchModel match) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          Spacing.base2x, Spacing.base, Spacing.base2x, Spacing.base),
      child: Text(
        "Starts at ${match.date.getFormattedDateAndTime()} ",
        style: GoogleFonts.cabin(fontSize: 12, color: Colors.white),
      ),
    );
  }
}
