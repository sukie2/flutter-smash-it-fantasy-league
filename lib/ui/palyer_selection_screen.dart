// import 'package:flutter/material.dart';
// import 'package:smash_it/constants/size_constants.dart';
// import 'package:smash_it/models/player_model.dart';
// import 'package:smash_it/models/player_row_data.dart';
// import 'package:smash_it/ui/widgets/player_row.dart';
//
// class PlayerSelectionScreen extends StatefulWidget {
//   @override
//   _PlayerSelectionScreenState createState() => _PlayerSelectionScreenState();
// }
//
// class _PlayerSelectionScreenState extends State<PlayerSelectionScreen> {
//   // List<PlayerRowData> playerList = [
//   //   PlayerRowData(PlayerModel('Wanindu Hasaranga', 9000, 'Bowling allrounder')),
//   //   PlayerRowData(PlayerModel('Dasun Shanaka', 5000, 'Batting allrounder')),
//   //   PlayerRowData(PlayerModel('Dasun Shanaka1', 5000, 'Batting allrounder')),
//   //   PlayerRowData(PlayerModel('Dasun Shanaka', 5000, 'Batting allrounder')),
//   //   PlayerRowData(PlayerModel('Dasun Shanaka', 5000, 'Batting allrounder')),
//   //   PlayerRowData(PlayerModel('Dasun Shanaka', 5000, 'Batting allrounder'))
//   // ];
//   // List<PlayerRowData> selectedList = [
//   //   PlayerRowData(PlayerModel('Wanindu Hasaranga', 9000, 'Bowling allrounder')),
//   //   PlayerRowData(PlayerModel('Dasun Shanaka', 5000, 'Batting allrounder')),
//   //   PlayerRowData(PlayerModel('Dasun Shanaka1', 5000, 'Batting allrounder')),
//   //   PlayerRowData(PlayerModel('Dasun Shanaka', 5000, 'Batting allrounder')),
//   //   PlayerRowData(PlayerModel('Dasun Shanaka', 5000, 'Batting allrounder')),
//   //   PlayerRowData(PlayerModel('Dasun Shanaka', 5000, 'Batting allrounder')),
//   //   PlayerRowData(PlayerModel('Dasun Shanaka', 5000, 'Batting allrounder')),
//   //   PlayerRowData(PlayerModel('Dasun Shanaka', 5000, 'Batting allrounder')),
//   //   PlayerRowData(PlayerModel('Dasun Shanaka', 5000, 'Batting allrounder'))
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Column(
//       children: <Widget>[
//         Expanded(
//           flex: 3,
//           child: Container(
//             child: CustomScrollView(
//               slivers: <Widget>[
//                 SliverAppBar(
//                   title: Text('Sliver App Bar'),
//                   expandedHeight: 100.0,
//                 ),
//                 SliverList(
//                   delegate: SliverChildBuilderDelegate(
//                     (BuildContext context, int index) {
//                       return PlayerRow(playerList[index]);
//                     },
//                     childCount: playerList.length,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         GridView.count(
//           padding: EdgeInsets.only(
//               top: Spacing.base2x,
//               bottom: Spacing.base3x,
//               left: Spacing.base2x,
//               right: Spacing.base2x),
//           shrinkWrap: true,
//           physics: const NeverScrollableScrollPhysics(),
//           crossAxisCount: 6,
//           childAspectRatio: 1.1,
//           children: List.generate(selectedList.length, (index) {
//             return Container(
//               padding: EdgeInsets.all(3),
//               child: CircleAvatar(
//                 child: Text(
//                   selectedList[index].player.name.substring(0, 2),
//                   style: Theme.of(context).textTheme.headline5,
//                 ),
//               ),
//             );
//           }),
//         )
//       ],
//     ));
//   }
// }
