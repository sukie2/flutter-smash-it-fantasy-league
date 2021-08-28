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
    PlayerRowData(Player('Dasun Shanaka', 5000, 'Batting allrounder'))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text('Sliver App Bar'),
            expandedHeight: 125.0,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return PlayerRow(playerList[index]);
              },
              childCount: 2,
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(8.0),
        child: RaisedButton(
          onPressed: () {},
          color: Colors.blue,
          textColor: Colors.white,
          child: Text('Fixed Button'),
        ),
      ),
    );
  }
}
