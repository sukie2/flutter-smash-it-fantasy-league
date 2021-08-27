import 'package:flutter/material.dart';
import 'package:smash_it/models/player.dart';
import 'package:smash_it/models/player_row_data.dart';
import 'package:smash_it/ui/widgets/game_info_widget.dart';
import 'package:smash_it/ui/widgets/player_row.dart';

class PlayerSelectionScreen extends StatefulWidget {
  @override
  _PlayerSelectionScreenState createState() => _PlayerSelectionScreenState();
}

class _PlayerSelectionScreenState extends State<PlayerSelectionScreen> {
  List<PlayerRowData> playerList = [
    PlayerRowData(Player('Wanindu Hasaranga', 9000, 'Bowling allrounder')),
    PlayerRowData(Player('Dasun Shanaka', 5000, 'Batting allrounder'))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
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
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return PlayerRow(playerList[index]);
              },
              childCount: 2, // 1000 list items
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              ///no.of items in the horizontal axis
              crossAxisCount: 6,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.teal[100 * (index % 9)],
                  child: Text('grid item $index'),
                );
              },
              childCount: 12,
            ),
          )
        ],
      ),
    );
  }
}
