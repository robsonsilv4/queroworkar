import 'package:flutter/material.dart';

class LoadingQW extends StatelessWidget {
  final double size;
  final Color? color;

  const LoadingQW({Key? key, required this.size, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.square(
        dimension: size,
        child: CircularProgressIndicator(
          color: color != null ? color : Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
