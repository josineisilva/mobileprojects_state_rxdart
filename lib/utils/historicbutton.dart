import 'package:flutter/material.dart';
import '../pages/historic.dart';

class historicButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Criando historicButton");
    return RaisedButton(
      child: Text('Historico'),
      onPressed: () {
        Navigator.push(context,
          MaterialPageRoute(builder: (context) => Historic()),
        );
      },
    );
  }
}
