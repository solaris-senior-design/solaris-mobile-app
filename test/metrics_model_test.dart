import 'package:flutter_test/flutter_test.dart';
import 'package:solaris_mobile_app/models/metric.dart';
import 'package:solaris_mobile_app/models/metrics_model.dart';
import 'dart:convert';
import 'dart:io';

void main() {
  test("creates a valid metrics model", () async {
    final file = File('test/test_resources/metrics_test.json');
    final jsonFile = json.decode(await file.readAsString());
    MetricsModel metricsTest = MetricsModel.fromJson(jsonFile["data"]);
    expect(metricsTest.getDataMetrics(), isA<List<Metric>>());
  });
}
