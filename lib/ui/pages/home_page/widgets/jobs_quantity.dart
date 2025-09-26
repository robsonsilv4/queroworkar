import 'package:flutter/material.dart';
import 'package:quero_workar/shared/constants/constants.dart';

class JobsQuantity extends StatelessWidget {
  const JobsQuantity({
    required this.quantity,
    this.padding,
    super.key,
  });

  final int quantity;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 2),
            child: Image.asset(
              Images.logo,
              width: 20,
              height: 20,
            ),
          ),
          if (quantity > 0)
            _QuantityText(quantity: quantity)
          else
            const _SearchingText(),
        ],
      ),
    );
  }
}

class _QuantityText extends StatelessWidget {
  const _QuantityText({required this.quantity});

  final int quantity;

  @override
  Widget build(BuildContext context) {
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
}

class _SearchingText extends StatelessWidget {
  const _SearchingText();

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Procurando vagas...',
      style: TextStyle(color: Colors.black87),
    );
  }
}
