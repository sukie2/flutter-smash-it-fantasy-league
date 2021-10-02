import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smash_it/constants/color_constants.dart';
import 'package:smash_it/controllers/home_controller.dart';
import 'package:smash_it/ui/profile/profile_screen.dart';

import 'history/history_screen.dart';
import 'home/home_screen.dart';

class DashboardScreen extends StatelessWidget {
  final HomeController homeController = HomeController.to;

  DashboardScreen() {
    homeController.page = 0.obs;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: homeController.pageController.value,
          children: [
            HomeScreen(),
            HistoryScreen(),
            ProfileScreen(),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          onTap: (value) {
            navigateToPage(value);
          },
          selectedItemColor: Colors.white,
          unselectedItemColor: FantasyColors.SecondaryColor,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: FantasyColors.PrimaryColor,
          elevation: 0,
          currentIndex: homeController.page.value,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.history), label: 'History'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Settings')
          ],
        ),
      ),
    );
  }

  navigateToPage(int input) {
    homeController.animateTo(input);
    homeController.onPageChanged(input);
    // if(input == 0){
    //   drawer.onPageChanged(0);
    //   drawer.resetController(input);
    // }
  }
}
