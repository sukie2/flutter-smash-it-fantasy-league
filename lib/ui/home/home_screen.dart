import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smash_it/constants/size_constants.dart';
import 'package:smash_it/constants/string_constants.dart';
import 'package:smash_it/controllers/home_controller.dart';

class HomeScreen extends StatelessWidget {
  final HomeController homeController = HomeController.to;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              title: buildTitleBar(context),
            ),
          ),
          buildUpComingSeries(context),
        ],
      ),
    );
  }

  buildUpComingSeries(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: homeController.getData(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return SliverToBoxAdapter(child: Text('Something went wrong'));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return SliverToBoxAdapter(child: Text("Loading"));
        }

        return SliverToBoxAdapter(
          child: Container(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: snapshot.data?.docs.length,
              itemBuilder: (BuildContext context, int index) {
                DocumentSnapshot document = snapshot.data!.docs[index];
                return ListTile(
                  title: Text(document['name']),
                  subtitle: Text(document['type']),
                  onTap: () {},
                );
              },
            ),
          ),
        );
      },
    );
  }

  buildTitleBar(BuildContext context) {
    return PreferredSize(
      child: Padding(
        padding: EdgeInsets.only(
          top: Sizes.base5x,
          left: Sizes.base,
          right: Sizes.base,
        ),
        child: Text(Strings.app_name),
      ),
      preferredSize: Size(
        MediaQuery.of(context).size.width,
        60.0,
      ),
    );
  }
}
