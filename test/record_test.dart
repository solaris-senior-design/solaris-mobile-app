import 'package:flutter_test/flutter_test.dart';
import 'package:solaris_mobile_app/models/metric.dart';
import 'dart:convert';
import 'dart:io';
import 'package:solaris_mobile_app/models/record.dart';

void main() {
  test("creates a valid record model", () async {
    final file = File('test/test_resources/metrics_test.json');
    final jsonFile = json.decode(await file.readAsString());
    Record recordTest = Record.fromJson(jsonFile["data"]["record"]);
    expect(recordTest.getDataMetrics(), isA<List<Metric>>());
    expect(recordTest.timestamp, isA<DateTime>());
  });
}
