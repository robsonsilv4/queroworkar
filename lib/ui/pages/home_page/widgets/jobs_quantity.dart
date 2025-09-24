import 'package:flutter/material.dart';

import 'package:quero_workar/shared/constants/qw_theme.dart';

class JobsQuantity extends StatelessWidget {
  const JobsQuantity({
    required this.quantity,
    super.key,
  });
  final int quantity;

  @override
  Widget build(BuildContext context) {
    if (quantity > 0) {
      return RichText(
        text: TextSpan(
          children: [
            const TextSpan(
              text: 'Nós encontramos ',
              style: TextStyle(color: QWTheme.title),
            ),
            TextSpan(
              text: quantity.toString(),
              style: TextStyle(color: Colors.red.shade700),
            ),
            const TextSpan(
              text: ' vagas para você.',
              style: TextStyle(color: QWTheme.title),
            ),
          ],
        ),
      );
    }

    return const Text(
      'Procurando vagas...',
      style: TextStyle(color: Colors.black87),
    );
  }
}
