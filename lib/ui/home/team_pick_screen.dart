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
  final selectedPlayers = new Map<String, PlayerModel>();

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FantasyColors.PrimaryColor,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(
            Spacing.base2x, Spacing.base2x, Spacing.base2x, Spacing.base3x),
        child: StreamBuilder<QuerySnapshot>(
          stream: homeController.getPlayerData(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            return CustomScrollView(
              shrinkWrap: true,
              slivers: [
                buildAppBar(),
                buildSelectedList(),
                buildTopRankList(context, snapshot),
              ],
            );
          },
        ),
      ),
    );
  }

  buildSelectedList() {
    return SliverGrid.count(crossAxisCount: 4, children: [Text('asd')]);

    //   gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
    //     maxCrossAxisExtent: 200.0,
    //     mainAxisSpacing: 10.0,
    //     crossAxisSpacing: 10.0,
    //     childAspectRatio: 4.0,
    //   ),
    //   delegate: SliverChildBuilderDelegate(
    //     (BuildContext context, int index) {
    //       return Container(
    //         alignment: Alignment.center,
    //         child: CircleAvatar(
    //           radius: 30,
    //           backgroundColor: Colors.brown.shade800,
    //           child: Text(
    //             "Hahs Sdsa".getInitials(),
    //             style: GoogleFonts.oswald(fontSize: 24, color: Colors.white),
    //           ),
    //         ),
    //       );
    //     },
    //     childCount: 20,
    //   ),
    // );
  }

  buildAppBar() {
    return SliverAppBar(
      backgroundColor: FantasyColors.PrimaryColor,
      automaticallyImplyLeading: false,
      elevation: 0,
      pinned: true,
      expandedHeight: 100,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.only(top: 0, bottom: Spacing.base2x),
        centerTitle: false,
        title: Container(
          child: Text(Strings.pick_your_team,
              style: GoogleFonts.bebasNeue(
                  fontSize: 30, fontWeight: FontWeight.w600, letterSpacing: 1)),
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
          return Container(
            alignment: Alignment.center,
            child: RowTeamPicker(
              player: PlayerModel(
                  name: document?['name'],
                  points: document?['points'],
                  role: document?['role'],
                  country: document?['country']),
              rankIndex: index + 1,
              onTap: (PlayerModel player) {
                this.onTap(player);
              },
            ),
          );
        },
        childCount: snapshot.data?.docs.length,
      ),
    );
  }

  onTap(PlayerModel player) {
    if (selectedPlayers.containsKey(player.name)) {
      selectedPlayers.remove(player.name);
    } else {
      selectedPlayers.putIfAbsent(player.name, () => player);
    }
    selectedPlayers.forEach((key, value) {
      print(key);
    });
  }
}
