import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smash_it/constants/color_constants.dart';
import 'package:smash_it/constants/size_constants.dart';
import 'package:smash_it/constants/string_constants.dart';
import 'package:smash_it/controllers/home_controller.dart';
import 'package:smash_it/models/match_model.dart';
import 'package:smash_it/ui/widgets/slide_match_card.dart';

class HomeScreen extends StatelessWidget {
  final HomeController homeController = HomeController.to;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FantasyColors.PrimaryColor,
      body: Padding(
        padding: const EdgeInsets.all(Spacing.base2x),
        child: CustomScrollView(
          shrinkWrap: true,
          slivers: [
            SliverAppBar(
              backgroundColor: FantasyColors.PrimaryColor,
              elevation: 0,
              pinned: true,
              expandedHeight: 100,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.only(top: 0, bottom: Spacing.base2x),
                centerTitle: false,
                title: buildTitleBar(),
              ),
            ),
            buildUpcomingMatchesTitleBar(),
            buildUpComingMatchesList(context),
            buildTopRankPlayer(),
            buildTopRankList(context),
          ],
        ),
      ),
    );
  }

  buildTopRankList(BuildContext context) {
    return SliverToBoxAdapter(
        child: Container(
      height: 200,
      child: StreamBuilder<QuerySnapshot>(
        stream: homeController.getData(),
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
              padding: EdgeInsets.zero,
              itemCount: snapshot.data?.docs.length,
              itemBuilder: (BuildContext context, int index) {
                DocumentSnapshot document = snapshot.data!.docs[index];
                return SlideMatchCard(
                  match: MatchModel(
                      matchNumber: '1st',
                      team1: 'Australia',
                      team2: 'Sri Lanka',
                      tournamentName: document['name'],
                      groundName: 'MCG',
                      submissions: '125'),
                );
              },
            ),
          );
        },
      ),
    ));
  }

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
                    onPressed: () {},
                    style: ButtonStyle(
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
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
            TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
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
      ),
    );
  }

  buildUpComingMatchesList(BuildContext context) {
    return SliverToBoxAdapter(
        child: Container(
      height: 200,
      child: StreamBuilder<QuerySnapshot>(
        stream: homeController.getData(),
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
              primary: false,
              padding: EdgeInsets.zero,
              itemCount: snapshot.data?.docs.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                DocumentSnapshot document = snapshot.data!.docs[index];
                return SlideMatchCard(
                  match: MatchModel(
                      matchNumber: '1st',
                      team1: 'Australia',
                      team2: 'Sri Lanka',
                      tournamentName: document['name'],
                      groundName: 'MCG',
                      submissions: '125'),
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
