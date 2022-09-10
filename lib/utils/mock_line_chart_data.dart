import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

var mockLineChartData = List.generate(voltageData.length,
    (i) => FlSpot(i.toDouble(), voltageData[i]["value"])).toList();

List<String> voltageTimeStamps = voltageData.map((e) {
  final dateFormat = DateFormat('h:mma');
  String date = dateFormat.format(DateTime.parse(e["date"]).toLocal());
  return date;
}).toList();

List<Map<String, dynamic>> voltageData = [
  {
    'date': '2022-05-06T20:47:08.533Z',
    'value': 0.0,
  },
  {
    'date': '2022-05-06T20:48:08.533Z',
    'value': 5.5,
  },
  {
    'date': '2022-05-06T20:49:08.533Z',
    'value': 2.3,
  },
  {
    'date': '2022-05-06T20:50:08.533Z',
    'value': 9.1,
  },
  {
    'date': '2022-05-06T20:51:08.533Z',
    'value': 9.9,
  },
];
