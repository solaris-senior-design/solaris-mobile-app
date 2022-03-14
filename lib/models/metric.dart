abstract class Metric {
  final String _parameter;
  final double value;
  final String _units;

  Metric(
    this._parameter,
    this._units, {
    required this.value,
  });

  String get parameter {
    return _parameter;
  }

  String get units {
    return _units;
  }
}
