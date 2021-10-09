import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smash_it/extentions/string_ext.dart';
import 'package:smash_it/models/player_model.dart';

class GridSelectedPlayer extends StatelessWidget {
  final PlayerModel player;

  GridSelectedPlayer({required this.player});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      minRadius: 100,
      backgroundColor: Colors.cyan,
      child: Text(
        player.name.getInitials(),
        style: GoogleFonts.oswald(fontSize: 24, color: Colors.white),
      ),
    );
  }
}
