import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smash_it/constants/color_constants.dart';
import 'package:smash_it/constants/size_constants.dart';
import 'package:smash_it/models/player_model.dart';

class RowTeamPicker extends StatelessWidget {
  final PlayerModel player;
  final int rankIndex;
  var isSelected = false.obs;

  RowTeamPicker({required this.player, required this.rankIndex});

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
              buildPlayerRow(player),
            ],
          ),
        ),
      ),
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '${player.name}, ',
                        style: GoogleFonts.bebasNeue(
                            fontSize: 22, color: Colors.white),
                      ),
                      Text(
                        player.country,
                        style:
                            GoogleFonts.lato(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                  Text(
                    player.role,
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
            ],
          ),
          Obx(
            () => GestureDetector(
              onTap: () {
                isSelected.value = !isSelected.value;
              },
              child: Icon(
                isSelected.value
                    ? Icons.check_circle_rounded
                    : Icons.check_circle_outline,
                size: 30,
                color: Colors.cyan,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
