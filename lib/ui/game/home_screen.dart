import 'package:flutter/material.dart';
import 'package:smash_it/constants/size_contants.dart';
import 'package:smash_it/controllers/auth_controller.dart';
import 'package:smash_it/controllers/home_controller.dart';

class HomeScreen extends StatelessWidget {
  final HomeController homeController = HomeController.to;
  final AuthController authController = AuthController.to;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 300,
            collapsedHeight: 150,
            // Display a placeholder widget to visualize the shrinking size.
            flexibleSpace: FlexibleSpaceBar(
              title: Padding(
                padding: EdgeInsets.only(
                    top: SizeConstants.base3x, left: SizeConstants.base2x),
                child: Column(
                  children: [
                    Icon(
                      Icons.account_circle,
                      color: Colors.white,
                      size: 85,
                    ),
                    Text('John Doe'),
                    Text('4498'),
                    Text('(Master IV)')
                  ],
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                ),
              ),
            ),
          ),
          SliverAppBar(
            toolbarHeight: 30,
            // Display a placeholder widget to visualize the shrinking size.
            flexibleSpace: FlexibleSpaceBar(
                title: Padding(
              padding: EdgeInsets.only(
                  top: SizeConstants.base3x, left: SizeConstants.base2x),
              child: Column(
                children: [
                  Text('Upcoming matches'),
                ],
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
              ),
            )),
            expandedHeight: 50,
            collapsedHeight: 40,
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  color: Colors.white,
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
