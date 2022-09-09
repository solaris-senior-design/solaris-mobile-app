import 'package:flutter/material.dart';

import '../utils/constants.dart';

class MetricCard extends StatefulWidget {
  final String parameter;
  final double value;
  final String units;

  const MetricCard(
      {Key? key,
      required this.parameter,
      required this.value,
      required this.units})
      : super(key: key);

  @override
  State<MetricCard> createState() => _MetricCardState();
}

class _MetricCardState extends State<MetricCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8.0,
          )
        ],
      ),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.parameter,
              style: kMetricsHeadingTextStyle,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                widget.value.toStringAsFixed(2),
                style: kMetricsValueTextStyle,
              ),
            ),
            Text(
              widget.units,
              style: kMetricsHeadingTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
