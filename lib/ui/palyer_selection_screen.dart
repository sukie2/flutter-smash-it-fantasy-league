import 'package:flutter/material.dart';
import 'package:smash_it/models/player.dart';
import 'package:smash_it/models/player_row_data.dart';
import 'package:smash_it/ui/widgets/player_row.dart';

class PlayerSelectionScreen extends StatefulWidget {
  @override
  _PlayerSelectionScreenState createState() => _PlayerSelectionScreenState();
}

class _PlayerSelectionScreenState extends State<PlayerSelectionScreen> {
  List<PlayerRowData> playerList = [
    PlayerRowData(Player('Wanindu Hasaranga', 9000, 'Bowling allrounder')),
    PlayerRowData(Player('Dasun Shanaka', 5000, 'Batting allrounder')),
    PlayerRowData(Player('Dasun Shanaka1', 5000, 'Batting allrounder')),
    PlayerRowData(Player('Dasun Shanaka', 5000, 'Batting allrounder')),
    PlayerRowData(Player('Dasun Shanaka', 5000, 'Batting allrounder')),
    PlayerRowData(Player('Dasun Shanaka', 5000, 'Batting allrounder'))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Expanded(
          flex: 3,
          child: Container(
            child: CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  title: Text('Sliver App Bar'),
                  expandedHeight: 100.0,
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return PlayerRow(playerList[index]);
                    },
                    childCount: playerList.length,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            padding: EdgeInsets.all(0),
            width: double.infinity,
            child: GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 6,
              children: List.generate(12, (index) {
                return CircleAvatar(
                  child: Text(
                    'P $index',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                );
              }),
            ),
          ),
        )
      ],
    ));
  }
}
