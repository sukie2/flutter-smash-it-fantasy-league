class Match {
  final String team1;
  final double team2;
  final String tournamentName;
  final String groundName;

  Match(this.team1, this.team2, this.tournamentName, this.groundName);

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
