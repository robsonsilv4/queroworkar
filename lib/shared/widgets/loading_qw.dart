import 'package:flutter/material.dart';

class LoadingQW extends StatelessWidget {
  const LoadingQW({required this.size, super.key, this.color});
  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.square(
        dimension: size,
        child: CircularProgressIndicator(
          color: color ?? Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
