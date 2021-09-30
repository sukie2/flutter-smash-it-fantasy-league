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
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: FantasyColors.PrimaryColor,
            elevation: 0,
            pinned: true,
            expandedHeight: 100,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.all(Spacing.base2x),
              centerTitle: false,
              title: buildTitleBar(context),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(Spacing.base2x),
              child: Container(
                height: MediaQuery.of(context).size.width / 1.5,
                child: buildUpComingSeries(context),
              ),
            ),
          ),
        ],
      ),
    );
  }

  buildUpComingSeries(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
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
    );
  }

  buildTitleBar(BuildContext context) {
    return Container(
      child: Text(Strings.app_name,
          style: GoogleFonts.bebasNeue(
              fontSize: 36, fontWeight: FontWeight.w700, letterSpacing: 1.3)),
    );
  }
}
