import 'package:flutter/material.dart';
import 'package:smash_it/constants/text_constants.dart';

class PlayerRow extends StatelessWidget {
  const PlayerRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 4,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: CircleAvatar(
                radius: 35,
                child: Text('DS'),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Dasun Shanaka',
                  style: TextConstants.kPlayerName,
                ),
                Text('Batting allrounder'),
              ],
            ),
            Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Text('\$ 4,000')),
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
