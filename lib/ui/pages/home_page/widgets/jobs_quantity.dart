import 'package:flutter/material.dart';

import '../../../../shared/constants/qw_theme.dart';

class JobsQuantity extends StatelessWidget {
  final int quantity;

  const JobsQuantity({
    Key? key,
    required this.quantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (quantity > 0) {
      return RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Nós encontramos ',
              style: TextStyle(color: QWTheme.title),
            ),
            TextSpan(
              text: quantity.toString(),
              style: TextStyle(color: Colors.red.shade700),
            ),
            TextSpan(
              text: ' vagas para você.',
              style: TextStyle(color: QWTheme.title),
            ),
          ],
        ),
      );
    }

    return Text(
      'Procurando vagas...',
      style: TextStyle(color: Colors.black87),
    );
  }
}
