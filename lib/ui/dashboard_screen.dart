import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smash_it/controllers/home_controller.dart';
import 'package:smash_it/ui/history/history_screen.dart';
import 'package:smash_it/ui/profile/profile_screen.dart';

import 'home/home_screen.dart';

class DashboardScreen extends StatelessWidget {
  final HomeController homeController = HomeController.to;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: homeController.tabIndex.value,
          children: [
            HomeScreen(),
            HistoryScreen(),
            ProfileScreen(),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          onTap: homeController.changeTabIndex,
          selectedItemColor: Colors.redAccent,
          unselectedItemColor: Colors.black,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: Colors.white,
          elevation: 0,
          currentIndex: homeController.tabIndex.value,
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
}
