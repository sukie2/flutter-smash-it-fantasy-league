import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smash_it/constants/color_constants.dart';
import 'package:smash_it/constants/size_constants.dart';
import 'package:smash_it/extentions/string_ext.dart';
import 'package:smash_it/models/player_model.dart';

class RowTopPlayer extends StatelessWidget {
  final PlayerModel player;
  final int rankIndex;

  RowTopPlayer({required this.player, required this.rankIndex});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Card(
          color: FantasyColors.SecondaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getPlayerRow(rankIndex, player),
            ],
          ),
        ),
      ),
    );
  }

  getPlayerRow(int rank, PlayerModel player) {
    if (rank == 1) {
      return buildTopPlayerRow(player);
    } else {
      return buildPlayerRow(player);
    }
  }

  buildTopPlayerRow(PlayerModel player) {
    return Stack(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset('images/rank_1.jpeg')),
        SizedBox(width: Spacing.base2x),
        Padding(
          padding: const EdgeInsets.all(Spacing.base2x),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Rank $rankIndex',
                style:
                    GoogleFonts.oswald(fontSize: 16, color: Colors.cyanAccent),
              ),
              Text(
                player.name,
                style: GoogleFonts.bebasNeue(fontSize: 22, color: Colors.white),
              ),
              Text(
                player.country,
                style: GoogleFonts.lato(fontSize: 16, color: Colors.white),
              ),
              Text(
                player.points,
                style: GoogleFonts.bebasNeue(
                    fontSize: 36,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1,
                    color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }

  buildPlayerRow(PlayerModel player) {
    return Padding(
      padding: const EdgeInsets.all(Spacing.base2x),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.brown.shade800,
                child: Text(
                  player.name.getInitials(),
                  style: GoogleFonts.oswald(fontSize: 24, color: Colors.white),
                ),
              ),
              SizedBox(width: Spacing.base2x),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Rank $rankIndex',
                    style: GoogleFonts.oswald(
                        fontSize: 16, color: Colors.cyanAccent),
                  ),
                  Text(
                    player.name,
                    style: GoogleFonts.bebasNeue(
                        fontSize: 22, color: Colors.white),
                  ),
                  Text(
                    player.country,
                    style: GoogleFonts.lato(fontSize: 16, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
          Text(
            player.points,
            style: GoogleFonts.bebasNeue(
                fontSize: 36,
                fontWeight: FontWeight.w600,
                letterSpacing: 1,
                color: Colors.white),
          ),
        ],
      ),
    );
  }
}
