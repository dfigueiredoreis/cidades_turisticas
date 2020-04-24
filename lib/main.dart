import 'package:flutter/material.dart';
import 'package:lista_cidades/screens/cidades_detalhes_screen.dart';
import 'package:lista_cidades/screens/cidades_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Cidades Turísticas App',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primaryColor: Color.fromRGBO(58, 66, 86, 1.0),
        fontFamily: 'Arial',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => CidadesScreen(),
        '/cidades_detalhes': (context) => CidadesDetalhesScreen(),
      },
    );
  }
}
