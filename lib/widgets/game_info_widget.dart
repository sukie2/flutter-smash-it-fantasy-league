import 'package:flutter/material.dart';

class GameInfoWidget extends StatelessWidget {
  const GameInfoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fill,
      child: Image.network(
          "https://resizer-vortals.eco.astro.com.my/tr:w-832,h-468,q-100,f-WebP/https://stadiumastro-kentico.s3.amazonaws.com/stadiumastro/media/perform-article/2018/may/8/adelaide-cropepd_1rqemel3rc1iv1ao7387z6u9rx.jpg?ext=.jpg"),
    );
  }
}
