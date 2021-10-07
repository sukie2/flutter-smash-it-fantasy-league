import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smash_it/constants/color_constants.dart';
import 'package:smash_it/constants/size_constants.dart';
import 'package:smash_it/constants/string_constants.dart';
import 'package:smash_it/controllers/history_controller.dart';
import 'package:smash_it/models/match_model.dart';
import 'package:smash_it/ui/widgets/slide_match_card.dart';

class HistoryScreen extends StatelessWidget {
  final HistoryController historyController = HistoryController.to;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FantasyColors.PrimaryColor,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(
            Spacing.base2x, Spacing.base2x, Spacing.base2x, 0),
        child: StreamBuilder<QuerySnapshot>(
          stream: historyController.getMatches(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            return CustomScrollView(
              shrinkWrap: true,
              slivers: [
                SliverAppBar(
                  backgroundColor: FantasyColors.PrimaryColor,
                  automaticallyImplyLeading: false,
                  elevation: 0,
                  pinned: true,
                  expandedHeight: 80,
                  flexibleSpace: FlexibleSpaceBar(
                    titlePadding:
                        EdgeInsets.only(top: 0, bottom: Spacing.base2x),
                    centerTitle: false,
                    title: buildTitleBar(),
                  ),
                ),
                buildHeadingRow(Strings.upcoming_matches, () {
                  print("tap 1");
                }, 0, Spacing.base),
                buildMatchHistoryList(context, snapshot),
              ],
            );
          },
        ),
      ),
    );
  }

  buildTitleBar() {
    return Container(
      child: Text(Strings.past_matches,
          style: GoogleFonts.bebasNeue(
              fontSize: 30, fontWeight: FontWeight.w600, letterSpacing: 1)),
    );
  }

  buildHeadingRow(
      String title, Function() onTap, double topPadding, double bottomPadding) {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.only(top: topPadding, bottom: bottomPadding),
        child: Row(
          textBaseline: TextBaseline.alphabetic,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          children: [
            Text(title,
                style: GoogleFonts.oswald(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: Colors.white)),
            RichText(
              text: TextSpan(
                  text: Strings.see_all,
                  style: GoogleFonts.lato(
                      fontSize: 12,
                      decoration: TextDecoration.underline,
                      color: Colors.cyanAccent),
                  recognizer: TapGestureRecognizer()..onTap = onTap),
            ),
          ],
        ),
      ),
    );
  }

  buildMatchHistoryList(BuildContext context, AsyncSnapshot snapshot) {
    if (snapshot.hasError) {
      return SliverToBoxAdapter(child: Text('Something went wrong'));
    }

    if (snapshot.connectionState == ConnectionState.waiting) {
      return SliverToBoxAdapter(child: Text("Loading"));
    }

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          DocumentSnapshot? document = snapshot.data?.docs[index];
          return Container(
            alignment: Alignment.center,
            child: SlideMatchCard(
              match: MatchModel(
                  matchNumber: document?['match_number'],
                  team1: document?['team1'],
                  team2: document?['team2'],
                  tournamentName: document?['series'],
                  groundName: document?['ground'],
                  submissions: document?['submissions'],
                  date: document?['start']),
              isHistoryRow: true,
            ),
          );
        },
        childCount: snapshot.data?.docs.length,
      ),
    );
  }
}
