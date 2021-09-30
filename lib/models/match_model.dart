class MatchModel {
  final String team1;
  final String team2;
  final String tournamentName;
  final String groundName;
  final String submissions;

  MatchModel(
      {required this.team1,
      required this.team2,
      required this.tournamentName,
      required this.groundName,
      required this.submissions});

  String getCountryFlag({teamName: String}) {
    switch (teamName) {
      case 'Australia':
        return 'images/flags/AU.png';
      case 'Sri Lanka':
        return 'images/flags/LK.png';
      default:
        return 'images/flags/AU.png';
    }
  }
}
