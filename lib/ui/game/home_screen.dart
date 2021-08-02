import 'package:flutter/material.dart';
import 'package:smash_it/controllers/home_controller.dart';

class HomeScreen extends StatelessWidget {
  final HomeController homeController = HomeController.to;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            // Display a placeholder widget to visualize the shrinking size.
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Scores'),
            ),
            expandedHeight: 100,
            collapsedHeight: 60,
          ),
          SliverAppBar(
            // Display a placeholder widget to visualize the shrinking size.
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Upcoming Matches'),
            ),
            expandedHeight: 100,
            collapsedHeight: 60,
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  color: Colors.blueGrey,
                  height: 40,
                  child: Text('Match $index'),
                );
              },
              childCount: 100,
            ),
          ),
        ],
      )),
    );
  }
}
