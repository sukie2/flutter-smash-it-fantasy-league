import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

extension TimeStampExt on Timestamp {
  String getFormattedDate() {
    DateTime date =
        new DateTime.fromMillisecondsSinceEpoch(this.millisecondsSinceEpoch);
    final DateFormat formatter = DateFormat('dd-MM-yyyy');
    return formatter.format(date);
  }
}
