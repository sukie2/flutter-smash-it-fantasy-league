import 'package:flutter/cupertino.dart';

class LogoAndTeamWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(
          image: AssetImage('images/SLC.png'),
          height: 50,
          fit: BoxFit.fill,
        ),
        Text('Sri Lanka'),
      ],
    );
  }
}
