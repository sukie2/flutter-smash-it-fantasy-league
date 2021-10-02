import 'package:cloud_firestore/cloud_firestore.dart';

class MatchModel {
  final int matchNumber;
  final String team1;
  final String team2;
  final String tournamentName;
  final String groundName;
  final int submissions;
  final Timestamp date;

  MatchModel(
      {required this.matchNumber,
      required this.team1,
      required this.team2,
      required this.tournamentName,
      required this.groundName,
      required this.submissions,
      required this.date});

  static String getCountryFlag({teamName: String}) {
    switch (teamName) {
      case 'Australia':
        return 'images/flags/AU.png';
      case 'Sri Lanka':
        return 'images/flags/LK.png';
      case 'England':
        return 'images/flags/England.png';
      default:
        return 'images/flags/AU.png';
    }
  }
}
