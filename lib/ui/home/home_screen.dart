import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smash_it/constants/color_constants.dart';
import 'package:smash_it/constants/size_constants.dart';
import 'package:smash_it/constants/string_constants.dart';
import 'package:smash_it/controllers/home_controller.dart';
import 'package:smash_it/models/match_model.dart';
import 'package:smash_it/ui/profile/profile_screen.dart';
import 'package:smash_it/ui/widgets/slide_match_card.dart';

class HomeScreen extends StatelessWidget {
  final HomeController homeController = HomeController.to;
  @override
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
                buildUpcomingMatchesTitleBar(),
                buildUpComingMatchesList(context),
                buildTopRankPlayer(),
                // buildTopRankList(context, snapshot),
              ],
            );
          },
        ),
      ),
    );
  }

  // buildTopRankList(BuildContext context, AsyncSnapshot snapshot) {
  //   if (snapshot.hasError) {
  //     return SliverToBoxAdapter(child: Text('Something went wrong'));
  //   }
  //
  //   if (snapshot.connectionState == ConnectionState.waiting) {
  //     return SliverToBoxAdapter(child: Text("Loading"));
  //   }
  //
  //   return SliverList(
  //     delegate: SliverChildBuilderDelegate(
  //       (BuildContext context, int index) {
  //         DocumentSnapshot? document = snapshot.data?.docs[index];
  //         return Container(
  //           alignment: Alignment.center,
  //           height: 200,
  //           child: SlideMatchCard(
  //             match: PlayerModel(
  //                 name: '1st',
  //                 points: 'Australia',
  //                 role: 'Sri Lanka',
  //                 country: document?['name']),
  //           ),
  //         );
  //       },
  //       childCount: snapshot.data?.docs.length,
  //     ),
  //   );
  // }

  buildTopRankPlayer() {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.only(bottom: Spacing.base),
        child: Stack(
          children: [
            Image(image: AssetImage('images/SLC.png')),
            Row(
              textBaseline: TextBaseline.alphabetic,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              children: [
                Text(Strings.upcoming_matches,
                    style: GoogleFonts.oswald(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Colors.white)),
                TextButton(
                    onPressed: () {
                      Get.to(ProfileScreen());
                    },
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all(Colors.red),
                    ),
                    child: Text(
                      Strings.see_all,
                      style: GoogleFonts.lato(
                          fontSize: 12,
                          decoration: TextDecoration.underline,
                          color: Colors.white),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }

  buildUpcomingMatchesTitleBar() {
    return SliverToBoxAdapter(
      child: Container(
        color: Colors.red,
        padding: EdgeInsets.only(bottom: Spacing.base),
        child: Row(
          textBaseline: TextBaseline.alphabetic,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          children: [
            Text(Strings.upcoming_matches,
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
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => print('click')),
            ),
          ],
        ),
      ),
    );
  }

  buildUpComingMatchesList(BuildContext context) {
    return SliverToBoxAdapter(
        child: Container(
      height: 150,
      child: StreamBuilder<QuerySnapshot>(
        stream: homeController.getMatches(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }

          return Container(
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
