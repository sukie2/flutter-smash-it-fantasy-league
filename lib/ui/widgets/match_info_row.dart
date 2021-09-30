import 'package:flutter/material.dart';
import 'package:smash_it/constants/size_constants.dart';

class MatchInfoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: Size.infinite.width,
          color: Colors.pinkAccent,
          child: Padding(
            padding: EdgeInsets.only(
                top: Spacing.baseHalf,
                bottom: Spacing.baseHalf,
                left: Spacing.base2x),
            child: Padding(
              padding: EdgeInsets.only(right: Spacing.baseHalf),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'ICC T20 World Cup, 2021',
                  ),
                  Icon(
                    Icons.chevron_right,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              left: Spacing.base2x,
              right: Spacing.base2x,
              top: Spacing.baseHalf),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('27, September, 2021, 02.00pm'),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Dubai'),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
