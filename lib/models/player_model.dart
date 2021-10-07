import 'package:get/get.dart';

class PlayerModel {
  final String name;
  final String points;
  final String role;
  final String country;
  var isSelected = false.obs;

  PlayerModel(
      {required this.role,
      required this.name,
      required this.points,
      required this.country});
}
