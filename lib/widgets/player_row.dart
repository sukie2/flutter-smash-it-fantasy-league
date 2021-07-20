import 'package:flutter/material.dart';

class PlayerRow extends StatelessWidget {
  const PlayerRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.0, top: 2.0, bottom: 2.0, right: 16.0),
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              child: Text('DS'),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Dasun Shanaka'),
                Text('Batting allrounder'),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('\$ 4,000'),
                Icon(
                  Icons.check,
                  color: Colors.greenAccent,
                  size: 20.0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
