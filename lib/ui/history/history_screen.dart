import 'package:flutter/material.dart';
import 'package:smash_it/constants/size_constants.dart';
import 'package:smash_it/ui/home/up_coming_matches.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            toolbarHeight: 30,
            // Display a placeholder widget to visualize the shrinking size.
            flexibleSpace: FlexibleSpaceBar(
                title: Padding(
              padding: EdgeInsets.only(top: Sizes.base3x, left: Sizes.base2x),
              child: Column(
                children: [
                  Text('Your past matches'),
                ],
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
              ),
            )),
            expandedHeight: 60,
            collapsedHeight: 40,
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return UpComingMatchRow();
              },
              childCount: 100,
            ),
          ),
        ],
      )),
    );
  }
}
