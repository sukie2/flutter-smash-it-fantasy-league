import 'package:flutter/material.dart';
import 'package:smash_it/widgets/game_info_widget.dart';
import 'package:smash_it/widgets/player_row.dart';

class PlayerSelectionScreen extends StatefulWidget {
  const PlayerSelectionScreen({Key? key}) : super(key: key);

  @override
  _PlayerSelectionScreenState createState() => _PlayerSelectionScreenState();
}

class _PlayerSelectionScreenState extends State<PlayerSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          floating: true,
          expandedHeight: 200,
          backgroundColor: Colors.blueGrey,
          flexibleSpace: FlexibleSpaceBar(
            background: GameInfoWidget(),
            title: Text('SL vs IND'),
          ),
        ),
        SliverFixedExtentList(
          itemExtent: 120.0,
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return PlayerRow();
            },
            childCount: 50,
          ),
        ),
      ],
    );
  }
}
