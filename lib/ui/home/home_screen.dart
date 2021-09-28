import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smash_it/constants/size_constants.dart';
import 'package:smash_it/constants/string_constants.dart';
import 'package:smash_it/controllers/home_controller.dart';
import 'package:smash_it/ui/widgets/slide_match_card.dart';

class HomeScreen extends StatelessWidget {
  final HomeController homeController = HomeController.to;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 100,
            flexibleSpace: FlexibleSpaceBar(
              title: buildTitleBar(context),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: MediaQuery.of(context).size.width / 1.5,
              child: buildUpComingSeries(context),
            ),
          ),
        ],
      ),
    );
  }

  buildUpComingSeries(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: homeController.getData(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return Container(
          child: ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: snapshot.data?.docs.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              DocumentSnapshot document = snapshot.data!.docs[index];
              return SlideMatchCard(
                title: document['name'],
                address: document['type'],
                rating: "3",
                img: 'images/SLC.png',
              );
            },
          ),
        );
      },
    );
  }

  buildUpComingSeries1(BuildContext context) {
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
              scrollDirection: Axis.horizontal,
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
