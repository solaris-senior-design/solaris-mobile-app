abstract class Metric {
  final String _parameter;
  final double _value;
  final String _units;

  Metric(this._parameter, this._value, this._units);

  String get parameter {
    return _parameter;
  }

  double get value {
    return _value;
  }

  String get units {
    return _units;
  }
}
