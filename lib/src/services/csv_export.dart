import 'package:csv/csv.dart';
import 'package:models/models.dart';
import 'dart:convert' show utf8;
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' show AnchorElement;

void exportCSV(List<Crime> list) {
  List<List<String>> activities = [];
  for (final c in list) {
    List<String> tList = [];
    tList.add('${c.name}, ');
    tList.add('${c.rank}, ');
    tList.add('${c.date.toString()}, ');
    tList.add('${c.activity}, ');
    tList.add('${c.produced}, ');

    activities.add(tList);
  }
  const conv = ListToCsvConverter();
  final res = conv.convert(activities);
  saveTextFile(res, 'All_Activities_${DateTime.now()}.csv');
}

void saveTextFile(String text, String filename) {
  AnchorElement()
    ..href = '${Uri.dataFromString(text, mimeType: 'text/csv', encoding: utf8)}'
    ..download = filename
    ..style.display = 'none'
    ..click();
}
