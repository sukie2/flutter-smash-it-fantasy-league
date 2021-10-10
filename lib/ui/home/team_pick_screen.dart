import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smash_it/constants/color_constants.dart';
import 'package:smash_it/constants/size_constants.dart';
import 'package:smash_it/constants/string_constants.dart';
import 'package:smash_it/controllers/home_controller.dart';
import 'package:smash_it/models/player_model.dart';
import 'package:smash_it/ui/widgets/list_elements/grid_selected_player.dart';
import 'package:smash_it/ui/widgets/list_elements/row_team_pick.dart';

class TeamPickScreen extends StatelessWidget {
  final HomeController homeController = HomeController.to;
  final selectedPlayers = new Map<String, GridSelectedPlayer>().obs;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FantasyColors.PrimaryColor,
      body: StreamBuilder<QuerySnapshot>(
        stream: homeController.getPlayerData(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          return CustomScrollView(
            slivers: [
              buildAppBar(),
              buildSelectedList(context),
              buildPlayerList(context, snapshot),
            ],
          );
        },
      ),
    );
  }

  List<Widget> getSelectedPlayers() {
    return selectedPlayers.values.toList();
  }

  buildEmptySelectedList(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        child: Card(
          color: FantasyColors.SecondaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 2.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Start adding players',
                style: GoogleFonts.bebasNeue(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    letterSpacing: 1),
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildSelectedList(BuildContext context) {
    return Obx(() {
      if (selectedPlayers.isEmpty) {
        return buildEmptySelectedList(context);
      } else {
        return SliverGrid.count(
          crossAxisSpacing: Spacing.baseHalf,
          crossAxisCount: 4,
          childAspectRatio: 0.84,
          children: getSelectedPlayers(),
        );
      }
    });
  }

  buildAppBar() {
    return SliverAppBar(
      centerTitle: false,
      backgroundColor: FantasyColors.PrimaryColor,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        title: Container(
          child: Text(Strings.pick_your_team,
              style: GoogleFonts.bebasNeue(
                  fontSize: 30, fontWeight: FontWeight.w600, letterSpacing: 1)),
        ),
      ),
    );
  }

  buildPlayerList(BuildContext context, AsyncSnapshot snapshot) {
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
      selectedPlayers.putIfAbsent(
          player.name, () => GridSelectedPlayer(player: player));
    }
    selectedPlayers.forEach((key, value) {
      print(key);
    });
  }
}
