import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smash_it/constants/color_constants.dart';
import 'package:smash_it/constants/size_constants.dart';
import 'package:smash_it/constants/string_constants.dart';
import 'package:smash_it/controllers/home_controller.dart';
import 'package:smash_it/models/player_model.dart';
import 'package:smash_it/ui/widgets/list_elements/row_team_pick.dart';

class TeamPickScreen extends StatelessWidget {
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
                buildTopRankList(context, snapshot),
              ],
            );
          },
        ),
      ),
    );
  }

  buildTitleBar() {
    return Container(
      child: Text(Strings.pick_your_team,
          style: GoogleFonts.bebasNeue(
              fontSize: 30, fontWeight: FontWeight.w600, letterSpacing: 1)),
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
          return Container(
            alignment: Alignment.center,
            child: RowTeamPicker(
              player: PlayerModel(
                  name: document?['name'],
                  points: document?['points'],
                  role: document?['role'],
                  country: document?['country']),
              rankIndex: index + 1,
            ),
          );
        },
        childCount: snapshot.data?.docs.length,
      ),
    );
  }
}
