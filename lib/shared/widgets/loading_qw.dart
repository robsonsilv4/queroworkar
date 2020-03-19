import 'package:flutter/material.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';

class LoadingQW extends StatelessWidget {
  final double size;
  final Color color;

  const LoadingQW({
    Key key,
    @required this.size,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Loading(
        indicator: BallPulseIndicator(),
        size: size,
        color: color != null ? color : Theme.of(context).primaryColor,
      ),
    );
  }
}
