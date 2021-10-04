extension StringExt on String {
  String getInitials() {
    var array = this.split(' ');
    if (array.isNotEmpty && array.length > 1) {
      return '${array[0][0]}${array[1][0]}';
    }
    return '';
  }
}
