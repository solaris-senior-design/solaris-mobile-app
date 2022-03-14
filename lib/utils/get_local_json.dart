import 'package:flutter/services.dart' show rootBundle;

Future<String> getLocalJson() {
  return rootBundle.loadString('assets/metrics.json');
}
