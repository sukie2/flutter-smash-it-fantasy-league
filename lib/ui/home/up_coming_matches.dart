import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smash_it/constants/size_constants.dart';
import 'package:smash_it/ui/widgets/logo_and_team.dart';
import 'package:smash_it/ui/widgets/match_info_row.dart';

class UpComingMatchRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        MatchInfoWidget(),
        Padding(
          padding: EdgeInsets.all(Spacing.base2x),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              LogoAndTeamWidget(),
              Text('VS'),
              LogoAndTeamWidget(),
            ],
          ),
        )
      ],
    );
  }
}
