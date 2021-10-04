import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smash_it/constants/color_constants.dart';
import 'package:smash_it/constants/size_constants.dart';
import 'package:smash_it/constants/string_constants.dart';
import 'package:smash_it/controllers/home_controller.dart';
import 'package:smash_it/models/match_model.dart';
import 'package:smash_it/models/player_model.dart';
import 'package:smash_it/ui/widgets/list_elements/row_top_player.dart';
import 'package:smash_it/ui/widgets/slide_match_card.dart';

class HomeScreen extends StatelessWidget {
  final HomeController homeController = HomeController.to;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FantasyColors.PrimaryColor,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(
            Spacing.base2x, Spacing.base2x, Spacing.base2x, 0),
        child: StreamBuilder<QuerySnapshot>(
          stream: homeController.getPlayerData(),
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
                  expandedHeight: 100,
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
                buildUpComingMatchesList(context),
                buildHeadingRow(Strings.top_players, () {
                  print("tap 2");
                }, Spacing.base2x, Spacing.base),
                buildTopRankList(context, snapshot),
              ],
            );
          },
        ),
      ),
    );
  }

  buildTopRankList(BuildContext context, AsyncSnapshot snapshot) {
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
          if (index > 0) {
            return Container(
              alignment: Alignment.center,
              child: RowTopPlayer(
                player: PlayerModel(
                    name: document?['name'],
                    points: document?['points'],
                    role: document?['role'],
                    country: document?['country']),
              ),
            );
          } else {
            return Text("dsf");
          }
        },
        childCount: snapshot.data?.docs.length,
      ),
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
                      color: Colors.white),
                  recognizer: TapGestureRecognizer()..onTap = onTap),
            ),
          ],
        ),
      ),
    );
  }

  buildUpComingMatchesList(BuildContext context) {
    return SliverToBoxAdapter(
        child: Container(
      height: 165,
      child: StreamBuilder<QuerySnapshot>(
        stream: homeController.getMatches(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }

          return ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 200, minHeight: 160),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data?.docs.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                DocumentSnapshot? document = snapshot.data?.docs[index];
                return SlideMatchCard(
                  match: MatchModel(
                      matchNumber: document?['match_number'],
                      team1: document?['team1'],
                      team2: document?['team2'],
                      tournamentName: document?['series'],
                      groundName: document?['ground'],
                      submissions: document?['submissions'],
                      date: document?['start']),
                );
              },
            ),
          );
        },
      ),
    ));
  }

  buildTitleBar() {
    return Container(
      child: Text(Strings.app_name,
          style: GoogleFonts.bebasNeue(
              fontSize: 36, fontWeight: FontWeight.w600, letterSpacing: 1)),
    );
  }
}
