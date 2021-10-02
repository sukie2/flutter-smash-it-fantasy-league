import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

extension TimeStampExt on Timestamp {
  String getFormattedDateAndTime() {
    DateTime date =
        new DateTime.fromMillisecondsSinceEpoch(this.millisecondsSinceEpoch);
    final DateFormat formatter = DateFormat('hh:mm a, dd MMM yyyy');
    return formatter.format(date);
  }
}
