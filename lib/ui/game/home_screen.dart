import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smash_it/controllers/auth_controller.dart';
import 'package:smash_it/ui/auth/login_screen.dart';

class HomeScreen extends StatelessWidget {
  final AuthController authController = AuthController.to;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.logout_rounded),
            tooltip: 'Logout',
            onPressed: () async {
              await authController.signOut();
              Get.to(() => LoginScreen());
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.mail),
            title: new Text('Messages'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text('Profile'))
        ],
      ),
      body: Container(
          child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            // Display a placeholder widget to visualize the shrinking size.
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Score'),
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
