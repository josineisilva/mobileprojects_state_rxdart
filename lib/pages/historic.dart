import 'package:flutter/material.dart';
import '../blocs/bloc.dart';

//
// Classe para exibir o historico das cores
//
class Historic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Historico"),
      ),
      body: _body(),
    );
  }
}

//
// Corpo da tela
//
ListView _body() {
  print("Criando historico");
  MyBLoC bloc = MyBLoC();
  List<Color> _colors = bloc.colorSubject.values;
  print("colors ${_colors.length}");
  ListView ret = ListView.builder(
    itemCount: _colors.length,
    itemBuilder: (BuildContext ctxt, int index) {
      return Container(
        color: _colors[index],
        child: ListTile(
          title: Text('Cor ${index+1}'),
        ),
      );
    },
  );
  return ret;
}
