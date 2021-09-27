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
                top: Sizes.baseHalf,
                bottom: Sizes.baseHalf,
                left: Sizes.base2x),
            child: Padding(
              padding: EdgeInsets.only(right: Sizes.baseHalf),
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
              left: Sizes.base2x, right: Sizes.base2x, top: Sizes.baseHalf),
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
