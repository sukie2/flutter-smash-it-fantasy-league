import 'package:flutter/material.dart';
import 'package:smash_it/constants/size_contants.dart';

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
                top: SizeConstants.baseHalf,
                bottom: SizeConstants.baseHalf,
                left: SizeConstants.base2x),
            child: Text(
              'ICC T20 World Cup, 2021',
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              left: SizeConstants.base2x,
              right: SizeConstants.base2x,
              top: SizeConstants.baseHalf),
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
