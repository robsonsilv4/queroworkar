import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Icon(
        Icons.info,
        color: Colors.black54,
        size: 24.0,
      ),
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return SimpleDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),
              contentPadding: EdgeInsets.symmetric(
                vertical: 15.0,
              ),
              children: <Widget>[
                Text(
                  'Desenvolvido por:',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 10.0,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Text(
                  'Robson Silva',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0,
                  ),
                ),
                Text(
                  'github.com/robsonsilv4',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12.0,
                  ),
                ),
                Text(
                  'linkedin.com/in/robsonsilv4',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12.0,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Agradecimentos:',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 10.0,
                  ),
                ),
                Text(
                  'Mobills e Emerson Vieira',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12.0,
                  ),
                ),
                Text(
                  'Zarathon Maia',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12.0,
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
