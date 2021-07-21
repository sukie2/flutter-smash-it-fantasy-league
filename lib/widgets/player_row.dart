import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smash_it/constants/text_constants.dart';
import 'package:smash_it/models/player.dart';

class PlayerRow extends StatelessWidget {
  final Player player;
  PlayerRow(this.player);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('tap');
      },
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.pink, // .withOpacity(0.5),
                spreadRadius: 4,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: CircleAvatar(
                  radius: 35,
                  child: Text(
                    'DS',
                    style: GoogleFonts.permanentMarker(
                        textStyle: TextConstants.kPlayerNameInitials),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    player.name,
                    style: GoogleFonts.oswald(
                        textStyle: TextConstants.kPlayerName),
                  ),
                  Text(
                    player.type,
                    style: GoogleFonts.oswald(
                        textStyle: TextConstants.kPlayerCategory),
                  ),
                ],
              ),
              Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Text(
                        '\$${player.cost}',
                        style: TextConstants.kPlayerCost,
                      )),
                  Icon(
                    Icons.check,
                    color: Colors.greenAccent,
                    size: 20.0,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
