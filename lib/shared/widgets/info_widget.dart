import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  const Info({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: const Icon(
        Icons.info,
        color: Colors.black54,
        size: 24,
      ),
      onTap: () => showDialog<void>(
        context: context,
        builder: (context) {
          return const SimpleDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            contentPadding: EdgeInsets.symmetric(
              vertical: 15,
            ),
            children: <Widget>[
              Text(
                'Desenvolvido por:',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 10,
                  fontStyle: FontStyle.italic,
                ),
              ),
              Text(
                'Robson Silva',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              Text(
                'github.com/robsonsilv4',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              Text(
                'linkedin.com/in/robsonsilv4',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Agradecimentos:',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 10,
                ),
              ),
              Text(
                'Emerson Vieira',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              Text(
                'Zarathon Maia',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
