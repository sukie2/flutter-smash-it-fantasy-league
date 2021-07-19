import 'package:flutter/material.dart';

class PlayerRow extends StatelessWidget {
  const PlayerRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.0, top: 2.0, bottom: 2.0, right: 16.0),
      child: Card(
        child: Row(
          children: [
            CircleAvatar(
              child: Text('SU'),
            )
          ],
        ),
      ),
    );
  }
}
