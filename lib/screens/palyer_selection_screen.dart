import 'package:flutter/material.dart';
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
          title: Text('Pick your XI'),
          expandedHeight: 30,
          collapsedHeight: 150,
        ),
        SliverAppBar(
          backgroundColor: Colors.blue,
          title: Text('SL vs IND'),
          floating: true,
        ),
        SliverFixedExtentList(
          itemExtent: 100.0,
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
