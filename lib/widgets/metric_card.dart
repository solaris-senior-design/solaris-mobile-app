import 'package:flutter/material.dart';

import '../utils/constants.dart';

class MetricCard extends StatefulWidget {
  final String parameter;
  final double value;
  final String units;
  final String ranges;
  final bool needIcon;

  const MetricCard(
      {Key? key,
      required this.parameter,
      required this.value,
      required this.units,
      required this.ranges,
      required this.needIcon})
      : super(key: key);

  @override
  State<MetricCard> createState() => _MetricCardState();
}

class _MetricCardState extends State<MetricCard> {
  Icon getWeatherIcon(double value) {
    if (value > 32000) {
      return const Icon(
        Icons.wb_sunny,
        color: kThemePrimaryColor,
        size: 30,
      );
    } else if (value > 10000) {
      return const Icon(
        Icons.brightness_6,
        color: kThemePrimaryColor,
        size: 30,
      );
    } else if (value > 1000) {
      return const Icon(
        Icons.cloud,
        color: kThemePrimaryColor,
        size: 30,
      );
    } else {
      return const Icon(
        Icons.wb_twighlight,
        color: kThemePrimaryColor,
        size: 30,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(25),
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(widget.parameter),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        "The value of ${widget.parameter.toLowerCase()} is ${widget.value} ${widget.units.toLowerCase()}"),
                    const SizedBox(height: 10),
                    Text("Ranges: ${widget.ranges}"),
                  ],
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("OK"))
                ],
              );
            });
      },
      child: Container(
        width: 170,
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4.0,
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
                padding: widget.needIcon
                    ? const EdgeInsets.all(7.5)
                    : const EdgeInsets.all(15.0),
                child: Text(
                  widget.value.toStringAsFixed(2),
                  style: widget.needIcon
                      ? kMetricsValueSecondaryTextStyle
                      : kMetricsValueTextStyle,
                ),
              ),
              widget.needIcon
                  ? Padding(
                      padding: const EdgeInsets.only(bottom: 7.5),
                      child: getWeatherIcon(widget.value),
                    )
                  : const SizedBox(),
              Text(
                widget.units,
                style: kMetricsHeadingTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
