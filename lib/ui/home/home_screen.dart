import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smash_it/constants/size_constants.dart';
import 'package:smash_it/controllers/auth_controller.dart';
import 'package:smash_it/controllers/home_controller.dart';
import 'package:smash_it/ui/home/up_coming_matches.dart';
import 'package:smash_it/ui/palyer_selection_screen.dart';

class HomeScreen extends StatelessWidget {
  final HomeController homeController = HomeController.to;
  final AuthController authController = AuthController.to;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: 300,
            collapsedHeight: 150,
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
            automaticallyImplyLeading: false,
            toolbarHeight: 30,
            flexibleSpace: FlexibleSpaceBar(
                title: Padding(
              padding: EdgeInsets.only(
                  top: SizeConstants.base3x, left: SizeConstants.base2x),
              child: Column(
                children: [
                  Text('Upcoming matchess'),
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
                return GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  child: UpComingMatchRow(),
                  onTap: () {
                    Get.to(PlayerSelectionScreen());
                  },
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
