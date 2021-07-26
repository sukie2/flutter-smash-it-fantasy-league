import 'package:flutter/material.dart';

class GameInfoWidget extends StatelessWidget {
  const GameInfoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
        fit: BoxFit.fill, child: Image.asset('images/ground.jpeg'));
  }
}
